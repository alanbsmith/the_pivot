class ListingsController < ApplicationController
  def new
    @listing = Listing.new
  end

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
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

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to listings_path
    else
      format.html {render :edit }
    end

  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_path, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
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
