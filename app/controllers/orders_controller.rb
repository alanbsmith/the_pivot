class OrdersController < ApplicationController
  include CurrentCart
  include SessionsHelper
  before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def new
    if signed_in?
      if @cart.cart_items.empty?
        redirect_to items_path, notice: "Your cart is empty, Fill it with Icecream!"
        return
      end
      @order = Order.new
    else
      redirect_to signin_path, notice: "Sign in before placing your order"
    end
  end

  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil

      format.html { redirect_to items_url,
        notice: 'Thank you for ordering some of our Scream Cream' }
      format.json { render action: 'show', status: :created,
        location: @order }
    else
      format.html { render action: 'new' }
      format.json { render json: @order.errors,
        status: :unprocessable_entity }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
