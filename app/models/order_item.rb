class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order

  def total_price
    product.price * quantity
  end

end
