class Administrator::OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  private



end
