class CartsController < ApplicationController

  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, with: :cart_is_empty

  def show
    # @cart is set by ApplicationController before_action of :set_cart
    @user   = current_user
    @resume = Resume.new
  end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil

    respond_to do |format|
      format.html { cart_is_empty }
      format.json { head :no_content }
    end
  end

  private

  def cart_is_empty
    redirect_to listings_path, notice: 'Your cart is now empty.'
  end
end
