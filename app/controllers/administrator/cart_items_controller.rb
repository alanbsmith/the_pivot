class Administrator::CartItemsController < AdminsController



  def destroy
    @order = Order.find(params[:id])
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to administrator_orders_path
  end
end
