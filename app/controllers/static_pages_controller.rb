class StaticPagesController < ApplicationController

  def home
    @user  = User.find_by(params[:id])
  end

  def about
  end


  def contact
  end


  private

end
