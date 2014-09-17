class CartsController < ApplicationController

  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, with: :empty_cart

  def show
    @cart = Cart.find(params[:id])
    @user = current_user
  end

  def new
    current_cart ||= Cart.new(params[:id])
    current_cart.cart_listings.create(listing_id: params[:id], cart_id: current_cart.id)
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to cart_path,
        notice: 'Your cart is currently empty' }
      format.json { head :no_content }
    end
  end

  private

  def empty_cart
    redirect_to listings_path, notice: 'Your cart is now empty.'
  end
end
