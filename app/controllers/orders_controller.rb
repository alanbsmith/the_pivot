class OrdersController < ApplicationController
  include CurrentCart
  include SessionsHelper

  before_action :set_order, only: [:show, :edit, :update, :destroy,:create]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order


  def index
    if current_user && signed_in?
      @orders = current_user.orders
    else
      redirect_to items_path
    end
  end

  def show
    if current_user && signed_in
      @order = Order.find(params[:id])
    else
      redirect_to items_path
    end
  end

  def new
    ## fix me
    @order ||= Order.new(order_params)
    @order.order_items.create(item_id: params[:id], order_id: current_order.id)
  end

  def create
    ## fix me
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


  def destroy
    Order.find(session[:order_id]).destroy
    session[:order_id] = nil
    respond_to do |format|
      format.html { redirect_to items_url,
        notice: 'Your cart is currently empty' }
        format.json { head :no_content }
    end
  end

  private

  def order_params
    require(:order).permits(:status, :total, :receiving)
  end

  def invalid_order
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to items_url, notice: 'Invalid cart'

  def set_order
    @order = Order.find(params[:id])
  end
end
