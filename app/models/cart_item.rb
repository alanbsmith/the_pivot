class CartItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  belongs_to :cart

  def total_price
    item.price.to_f * quantity
  end
end
