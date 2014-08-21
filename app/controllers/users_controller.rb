class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to register_path, success: "Registration successful!"
  end



  def user_params
    params.require(:user).permit(:email, 
                                 :first_name, 
                                 :last_name, 
                                 :password, 
                                 :password_confirmation
                                 )
  end
end
