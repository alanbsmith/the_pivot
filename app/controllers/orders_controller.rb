class OrdersController < ActionController::Base
  def show
    @order = Order.find(params[:id])
  end

  def new
    current_order ||= Order.new(order_params)
    current_order.order_items.create(item_id: params[:id], order_id: current_order.id)
  end



  def order_params
    require(:order).permits(:status, :total, :receiving)
  end
end
