class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include CurrentOrder

  before_action :order

  def order
    @order ||= Order.find(session[:order_id]) if session[:order_id]
  end
end
