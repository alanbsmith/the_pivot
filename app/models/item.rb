class Item < ActiveRecord::Base
  has_many :order_items

  before_destroy :ensure_not_referenced_by_any_order_item

  has_many :orders, through: :order_items
  has_many :categorizations
  has_many :categories, through: :categorizations
  mount_uploader :image, ImageUploader

  # validates :name,
  #            presence: true,
  #            uniqueness: true
  # validates :description,
  #            presence: true,
  #            length: { in: 10..255 }
  # validates :image,
  #            presence: true
  # validates :price,
  #            presence: true,
  #            numericality: { greater_than: 0 }
  # validates :status: true

        # --> Write tests for all of the above validations then uncomment them!

  scope :active,  -> { where(status: 1) }
  scope :retired, -> { where(status: 2) }

  private
    def categories_list
      Category.all
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
