class OrdersController < ApplicationController
  include SessionsHelper
  include OrdersHelper

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order

  def index
    
    # @user_company = User.find_by(id: listing.creator_id)
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

    if @order.save
      set_resume_order_id(@order)
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to home_url, notice: 'Thanks for your submission!'
    else
      render :new
    end
  end
end
