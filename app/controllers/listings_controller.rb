class ListingsController < ApplicationController
  def new
    @listing = Listing.new
  end

  def index
    @listings = Listing.all
    @user = current_user
  end

  def show
  end

  def create
		@listing = Listing.new(listing_params)
    respond_to do |format|
			if @listing.save
				format.html { redirect_to listings_path}
			else
				format.html {render :new }
			end
		end
  end


  private

  def listing_params
    	params.require(:listing).permit(:title,
																	 :description,
																	 :pay_rate,
                                   :job_type,
                                   :positions,
                                   :closing
																	 )
  end
end
