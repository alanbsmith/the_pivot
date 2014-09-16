class Order < ActiveRecord::Base

  has_many :cart_listings, dependent: :destroy
  has_many :listings, through: :cart_listings
  belongs_to :user
  validates :user_id, presence: true

  def add_cart_listings_from_cart(cart)
    cart.cart_listings.each do |listing|
      listing.cart_id = nil
      cart_listings << listing
    end
  end

end
