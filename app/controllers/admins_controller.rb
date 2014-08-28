class AdminsController < ApplicationController
  before_action :authorize?

  private

  def authorize?
      redirect_to("http://bringvictory.com/") unless current_user && current_user.role == "admin"
  end
end
