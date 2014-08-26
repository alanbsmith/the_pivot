class Item < ActiveRecord::Base
  before_destroy :ensure_not_referenced_by_any_order_item
  mount_uploader :image, ImageUploader

  has_many :order_items
  has_many :orders, through: :order_items

  has_many :categorizations
  has_many :categories, through: :categorizations

  scope :active,  -> { where(status: 1) }
  scope :retired, -> { where(status: 2) }

  def num_to_status
    if item.status == 1
      item.status = 'active'
    else item.status == 2
      item.status = 'retired'
    end
  end

  def categories_list
    self.categories.collect do |category|
      category.title
    end.join(", ")
  end

  def categories_list=(categories_string)
    category_names = categories_string.split(",").collect { |c| c.strip.downcase }.uniq
    new_or_found_categories = category_names.collect { |name| Category.find_or_create_by(name: name) }
    self.categories = new_or_found_categories
  end

  def ensure_not_referenced_by_any_order_item
    if order_items.empty?
      return true
    else
      errors.add(:base, 'Order Items Present')
      return false
    end
  end
end
