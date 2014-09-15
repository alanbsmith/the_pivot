class BusinessesController< ApplicationController
  
  def index
    @business = current_business(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save!
      Mailer.welcome_email(@business).deliver
      sign_in @business
      redirect_to @business
    else
      render :new
    end
  end

  def show
    @business = Business.where(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def business_params
    params.require(:business).permit(:company_name,
                                     :first_name,
                                     :last_name,
                                     :email
                                     )
  end
end