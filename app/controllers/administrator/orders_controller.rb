class Administrator::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def paid
    @orders = Order.paid
  end

  def completed
    @orders = Order.completed
  end

  def ordered
    @orders = Order.ordered
  end

  def cancelled
    @orders = Order.cancelled
  end

  private



end
