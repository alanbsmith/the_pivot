class ApplicantController < ApplicationController

  def new
    @applicant = Applicant.new
  end

  def show
    @applicant = Applicant.find(params[:id])
  end

  def create
    @applicant = Applicant.new(user_params)
    if @applicant.save!
      ApplicantMailer.welcome_email(@applicant).deliver
      sign_in @applicant
      redirect_to @applicant
    else
      render :new
    end
  end

  def index
  end

  private

  def user_params
    params.require(:applicant).permit(
                                 :email,
                                 :first_name,
                                 :last_name,
                                 :password,
                                 :password_confirmation)
  end
end
