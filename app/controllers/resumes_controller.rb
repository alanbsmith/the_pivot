class ResumesController < ApplicationController
  include SessionsHelper
  include ResumesHelper

  def index
    @company_orders  = Order.all
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user.id

    if @resume.save!
      redirect_to cart_path(@cart), notice: "Your resume has been successfully uploaded!"
    else
      redirect_to cart_path(@cart), alert: "Whoa there, Looks like there was an issue with your resume"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "Your resume has been deleted."
  end

  private

  def resume_params
    params.require(:resume).permit( :user_id,
                                    :order_id,
                                    :attachment )
  end

end
