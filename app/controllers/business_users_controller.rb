class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      UserMailer.welcome_email(@user).deliver
      sign_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:company_name,
                                 :email,
                                 :first_name,
                                 :last_name,
                                 :password,
                                 :password_confirmation)
  end
end
