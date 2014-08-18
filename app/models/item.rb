class Item < ActiveRecord::Base
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

  # scope: active_items,  -> { where(status: 'active')  }
  # scope: retired_items, -> { where(status: 'retired') }
  # scope: find_by_price, -> { where(price: 'price' ) } <-- not sure about this one...

        # --> Write tests for the above scopes!

  has_many :categorizations
  has_many :categories, through: :categorizations
  mount_uploader :image, ImageUploader

  def categories_list
    Category.all
  end
end
