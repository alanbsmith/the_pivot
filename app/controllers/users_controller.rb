class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # UserMailer.welcome_email(@user).deliver
      sign_in @user
      flash[:notice] = 'Account was sucsessfully created!'
      redirect_to @user
    else
      flash[:alert] = @user.errors.full_messages.reduce do |message,accumulator|
        accumulator += "  •  #{message}"
      end
      render :new
    end
  end

  def edit
  end

  def update
    current_user.update(user_params)
    flash[:notice] = 'Your resume was successfully uploaded'
    redirect_to cart_path(current_user.id)
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:company_name,
                                 :email,
                                 :first_name,
                                 :last_name,
                                 # :image,
                                 :password,
                                 :password_confirmation)
  end
end
