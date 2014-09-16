class ApplicantSessionsController < ApplicationController

  def new
  end

  def create
    applicant = Applicant.find_by(email: params[:session][:email].downcase)
    if applicant && applicant.authenticate(params[:session][:password])
      sign_in applicant
        redirect_to applicant
    else
      flash.now[:error] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
