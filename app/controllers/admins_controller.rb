class AdminsController < ApplicationController
  before_action :authorize?

  private

  def authorize?
      redirect_to("http://sd.keepcalm-o-matic.co.uk/i/keep-calm-and-oh-hell-no-10.png") unless current_user && current_user.role == "admin"
  end
end
