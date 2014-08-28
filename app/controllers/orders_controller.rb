class OrdersController < ApplicationController
  include CurrentCart
  include SessionsHelper

  before_action :set_cart,  only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order

  def index
    if signed_in?
      @orders = current_user.orders
    else
      redirect_to items_path
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
    if @cart.cart_items.empty?
      redirect_to items_url, notice: "Your cart is empty"
      return
    end

    if !current_user
      redirect_to signin_path
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_cart_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil

        format.html { redirect_to home_url,
          notice: 'Thank you for ordering some of our Scream Cream' }
        format.json { render action: 'show', status: :created,
          location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def update
    @order.cancelled

    @order.save
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status,
                                  :total,
                                  :receiving,
                                  :user_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def invalid_order
    logger.error "Attempt to access invalid order #{params[:id]}"
    redirect_to items_url, notice: 'Invalid order'
  end
end
