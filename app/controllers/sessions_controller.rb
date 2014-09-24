class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
        flash[:notice] = 'Sucsessfully Signed In!'
        if request.original_url != (root_url + sessions_path.gsub("/", ""))
          redirect_to(:back)
        else
          redirect_to user
        end
    else
      flash[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    sign_out
    flash[:notice] = "You have succsessfully signed out"
    redirect_to root_url
  end
end
