class CartItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  def create
    item = Item.find(params[:item_id])
    @cart_item = @cart.add_item(item.id)

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to items_path,
          notice: "#{item.title} has been added to your cart."}
        format.json { render action: 'show',
          status: :created, location: @cart_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart_item.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    respond_to do |format|
      format.html { redirect_to cart_path(@cart_item.cart), notice: 'Item was successfully removed form cart.' }
      format.json { head :no_content }
    end
  end

  private
    def cart_items_params
      params.require(:cart_item).permit(:item_id)
    end

    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end
end
