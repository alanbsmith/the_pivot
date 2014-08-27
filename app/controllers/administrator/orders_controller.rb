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

  private



end
