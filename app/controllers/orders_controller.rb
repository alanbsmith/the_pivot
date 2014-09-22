class OrdersController < ApplicationController
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order

  def index
    if signed_in?
      @orders = current_user.orders
    else
      redirect_to listings_path
    end
  end

  def new
    if @cart.cart_listings.empty?
      redirect_to @cart
    end

    if !current_user
      redirect_to signin_path
    end
    @order = Order.new
  end

  def create
    @order = Order.new(user_id: current_user.id)
    @order.add_cart_listings_from_cart(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil

        format.html { redirect_to home_url,
          notice: 'Thanks for your submission! You can view previous applications in your dashboard!' }
        format.json { render action: 'show', status: :created,
          location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   @order.cancelled

  #   @order.save
  #   redirect_to orders_path
  # end

  private

  def order_params
    params.require(:order).permit(:user_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def invalid_order
    logger.error "Attempt to access invalid order #{params[:id]}"
    redirect_to items_url, notice: 'Invalid order'
  end
end
