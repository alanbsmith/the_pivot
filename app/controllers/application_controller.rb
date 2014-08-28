class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CurrentCart

  before_action :set_cart

  def current_cart
    Cart.find(session[:cart_id])
  end
end
