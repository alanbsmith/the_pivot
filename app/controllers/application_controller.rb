class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include CurrentOrder

  before_action :set_order
  # made up bullshit about what authentication means
  #
  # class SessionsController
  #   def register
  #     user = User.create!
  #     session[:user_id] = user.id
  #   end
  #
  #   def login
  #     user = get_user_for(pass, username)
  #     session[:user_id] = user.id
  #   end
  #
  #   def logout
  #     session[:user_id].clear
  #   end
  # end

  # def current_user
  #   @current_user ||= User.find session[:user_id]
  # end

  # def cart
  #   @cart ||= Order.new do |cart|
  #     session[:cart].each do |item_id, quantity|
  #       cart.order_items.build item_id: item_id, quantity: quantity
  #     end
  #   end
  # end

  private

  # def set_cart
  #   session[:cart] ||= {}
  # end
end
