class ResumesController < ApplicationController
  include SessionsHelper

  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(user_id:  current_user.id,
                         cart_listing_id: @cart.id)
    @resume.document = params[:resume][:document]

    if @resume.save!
      redirect_to cart_path(@cart), notice: "Your resume has been successfully uploaded!"
    else
      redirect_to cart_path(@cart), notice: "Whoa there, Looks like there was an issue with your resume"
    end
  end

  def show
  end

  def destroy
  end

  private

  def resume_params
    params.require(:resume).permit( :user_id,
                                    :cart_listing_id,
                                    :document )
  end

end
