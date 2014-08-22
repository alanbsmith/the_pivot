class CartsController < ApplicationController
  include CurrentCart
  include SessionsHelper
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :checkout]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def show
    @cart = Cart.find(params[:id])
  end

  def new
    current_cart ||= Cart.new(cart_params)
    raise "Boom"
    current_cart.cart_items.create(item_id: params[:id], cart_id: current_cart.id)
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to items_url,
        notice: 'Your cart is currently empty' }
        format.json { head :no_content }
    end
  end

  private

  def cart_params
    require(:cart).permits(:status, :total, :receiving)
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to items_url, notice: 'Invalid cart'
  end
end
