class OrderItemsController < ApplicationController
  include CurrentOrder
  before_action :set_order, only: [:create]
  # before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  def create
    item = Item.find(params[:item_id])
    @order_item = @order.add_item(item.id)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to items_path,
          notice: "#{item.title} has been added to your cart."}
        format.json { render action: 'show',
          status: :created, location: @order_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @order_item.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy

    respond_to do |format|
      format.html { redirect_to order_path(@order_item.order), notice: 'Item was successfully removed form cart.' }
      format.json { head :no_content }
    end
  end

  private
    def order_items_params
      params.require(:order_item).permit(:item_id)
    end

    def order
      @order
    end
end
