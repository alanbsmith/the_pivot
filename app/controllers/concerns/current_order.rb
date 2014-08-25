module CurrentOrder
  extend ActiveSupport::Concern

  private

  def set_order
    order = Order.find(session[:order_id])
    rescue ActiveRecord::RecordNotFound
    if current_user
      order = Order.create(status: "cart", user_id: current_user.id)
    else
      order = Order.create(status: "cart")
    end
    session[:order_id] = order.id
  end
end
