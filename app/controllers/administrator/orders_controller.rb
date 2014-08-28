class Administrator::OrdersController < AdminsController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def paid
    @orders = Order.paid
  end

  def completed
    @orders = Order.completed
  end

  def ordered
    @orders = Order.ordered
  end

  def cancelled
    @orders = Order.cancelled
  end

  def cancel
    @order = Order.find(params[:id]).cancelled!
    redirect_to administrator_orders_path, notice: "Cancel Successful"
  end

  def complete
    @order = Order.find(params[:id]).completed!
    redirect_to administrator_orders_path, notice: "Successfully marked as Completed"
  end
end
