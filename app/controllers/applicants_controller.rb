class ApplicantsController < ApplicationController

  def new
    @applicant = Applicant.new
  end

  def show
    @applicant = Applicant.find(params[:id])
  end

  def create
    @applicant = Applicant.new(applicant_params)
    if @applicant.save!
      Mailer.welcome_applicant_email(@applicant).deliver
      sign_in @applicant
      redirect_to @applicant
    else
      render :new
    end
  end

  def index
  end

  private

  def applicant_params
    params.require(:applicant).permit(
                                 :first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end
end
