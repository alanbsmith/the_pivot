class Administrator::UsersController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @users = User.all
  end

end