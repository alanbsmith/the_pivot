class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
        flash[:notice] = 'Sucsessfully Logged In!'
        unless request.original_url == sessions_path
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
    redirect_to root_url
  end
end
