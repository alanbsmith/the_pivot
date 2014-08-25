class OrdersController < ApplicationController
  include CurrentOrder
  include SessionsHelper
  before_action :set_order, only: [:show, :edit, :update, :destroy, :cart, :checkout, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_order


  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order ||= Order.new(order_params)
    @order.order_items.create(item_id: params[:id], order_id: current_order.id)
  end

  def create
    @order = Order.create(order_params)
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

  def cart
    @order = Order.find(params[:id])
  end

  def checkout
    if @order.order_items.empty?
      redirect_to items_url, notice: "Your cart is empty"
    else

      if signed_in?
        @order.update(status: 'open', user_id: current_user.id)

        respond_to do |format|
          format.html { redirect_to review_path }
          format.json { head :no_content }
        end
      else
        # flash.notice = "You need to sign in to order delicious icecream!"
        redirect_to signin_path
      end

    end
  end

  def review
  end

  def complete
    @order.update(status: 'complete')
    session[:order_id] = nil
    redirect_to home_path
  end

  private

  def order_params
    require(:order).permits(:status, :total, :receiving)
  end

  def invalid_order
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to items_url, notice: 'Invalid cart'
  end
end
