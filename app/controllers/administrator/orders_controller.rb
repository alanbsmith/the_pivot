class Administrator::OrdersController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @orders = Order.all
  end
end