class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    redirect_to home_path, notice: "Registration Successful!"
  end

  def user_params
    params.require(:user).permit(:email,
                                 :first_name,
                                 :last_name,
                                 :street,
                                 :city,
                                 :state,
                                 :zipcode,
                                 :password,
                                 :password_confirmation
                                 )
  end
end
