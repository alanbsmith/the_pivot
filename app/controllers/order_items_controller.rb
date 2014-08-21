class OrderItemsController < ApplicationController
  include CurrentOrder
  before_action :set_order, only: [:create]
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  def create
    item = Item.find(params[:item_id])
    @order_item = @order.add_item(item.id)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to items_path }
        format.json { render action: 'show',
          status: :created, location: @order_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @order_item.errors,
          status: :unprocessable_entity }
      end
    end
  end

  private
    def order_items_params
      params.require(:order_item).permit(:item_id)
    end
end
