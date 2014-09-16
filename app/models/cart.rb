class Cart < ActiveRecord::Base
  has_many :cart_listings, dependent: :destroy
  has_many :listings, through: :cart_listings

  def add_listing(listing_id)
    current_listing = cart_listing.find_by(listing_id: listing_id)
    if current_listing
      current_listing.quantity += 1
    else
      current_listing = cart_listings.create(listing_id: listing_id)
    end
    current_listing
  end

  def total_listings
    cart_listings.sum(:quantity)
  end
end
