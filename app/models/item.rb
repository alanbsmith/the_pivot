class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items
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

  # scope: find_by_price, -> { where(price: 'price' ) } <-- not sure about this one...

        # --> Write tests for the above scopes!

  has_many :categorizations
  has_many :categories, through: :categorizations
  mount_uploader :image, ImageUploader

  def categories_list
    Category.all
  end
end
