class Item < ActiveRecord::Base
  has_many :cart_items
  has_many :carts, through: :cart_items

  has_many :categorizations
  has_many :categories, through: :categorizations

  before_destroy :ensure_not_referenced_by_any_cart_item


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


    def num_to_status
      if item.status == 1
        item.status = 'active'
      else item.status == 2
        item.status = 'retired'
      end
    end

  private
    def categories_list
      Category.all
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
