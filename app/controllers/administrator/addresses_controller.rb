class Administrator::AddressesController < ApplicationController
  respond_to :html, :xml, :json

  def show
    @user = User.find(params[:id])
  end
end