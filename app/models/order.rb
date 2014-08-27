class Order < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  belongs_to :user
  validates :user_id, presence: true

  def add_cart_items_from_cart(cart)
    cart.cart_items.each do |item|
      item.cart_id = nil
      cart_items << item
    end
  end

  def total_price
    cart_items.to_a.sum { |cart_item| cart_item.total_price }
  end

end
