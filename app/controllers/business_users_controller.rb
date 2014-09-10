class BusinessUsersController < ApplicationController
  def new
    @business_user = User.new
  end
end