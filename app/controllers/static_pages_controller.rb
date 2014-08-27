class StaticPagesController < ApplicationController

  def home
    @user = User.find_by(params[:id])
    @item = Item.all.active
  end

  def about
  end


  def contact
  end


  private

end
