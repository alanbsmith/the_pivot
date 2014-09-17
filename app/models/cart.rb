class Cart < ActiveRecord::Base
  has_many :cart_listings, dependent: :destroy
  has_many :listings, through: :cart_listings

  def add_listing(listing_id)
    cart_listings.create(listing_id: listing_id)
  end

end
