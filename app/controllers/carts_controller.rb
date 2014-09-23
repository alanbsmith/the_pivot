class CartsController < ApplicationController

  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound, with: :cart_is_empty

  def show
    # @cart is set by ApplicationController before_action of :set_cart
    @user   = current_user
    @resume = Resume.new
  end
end
