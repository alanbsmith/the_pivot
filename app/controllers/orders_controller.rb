class OrdersController < ApplicationController
  include SessionsHelper
  include OrdersHelper

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order

  def index
    if signed_in?
      @orders = current_user.orders
    else
      redirect_to listings_path
    end
  end

  def show
    if signed_in?
      @order = Order.find(params[:id])
    else
      redirect_to items_path
    end
  end

  def new
    if @cart.cart_listings.empty?
      redirect_to @cart, notice: "You'll need to add a job listing to your cart to continue."
    end

    if !current_user
      redirect_to signin_path
    end
    @order = Order.new
  end

  def create
    @order = Order.new(user_id: current_user.id)
    @order.add_cart_listings_from_cart(@cart)
    if @order.save
      set_resume_order_id(@order)
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to home_url, notice: 'Thanks for your submission!'
    else
      render :new
    end
  end

  def update
    @order.cancelled

    @order.save
    redirect_to orders_path
  end

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
