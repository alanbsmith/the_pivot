class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def show
    @user = User.find_by_subdomain! request.subdomain
  end
end
