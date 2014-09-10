class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    redirect_to signin_path, notice: "Registration Successful!"
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
