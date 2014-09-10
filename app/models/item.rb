class  < ActiveRecord::Base
  has_many :cart_items
  has_many :carts, through: :cart_items

  has_many :categorizations
  has_many :categories, through: :categorizations

  before_save :default_image
  before_destroy :ensure_not_referenced_by_any_cart_item
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :price, presence: true

  scope :active,  -> { where(status: 1) }
  scope :retired, -> { where(status: 2) }

  def num_to_status
    if status == 1
      status = 'active'
    else status == 2
      status = 'retired'
    end
  end

  def categories_list(category_list)
    if category_list
      valid_categories = category_list.reject do |category|
       category.empty?
      end

      new_or_found_categories = valid_categories.map do |title|
        Category.find_or_create_by(title: title)
      end

      self.categories = new_or_found_categories
    end
  end

  def current_status
    if self.status == 1
      "active"
    else self.status == 2
      "retired"
    end
  end

  private

  def default_image
    self.image ||= "/app/assets/images/fallback/default_image.png"
  end

  def ensure_not_referenced_by_any_cart_item
    if cart_items.empty?
      return true
    else
      errors.add(:base, 'These Items are in a cart')
      return false
    end
  end
end
