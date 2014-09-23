class ListingsController < ApplicationController

  def new
    @listing    = Listing.new
    @categories = Category.all
  end

  def index
    @listings   = Listing.all
    @categories = Category.all
    @business   = find_business_from_listing
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params.merge creator_id: current_user.id)
    respond_to do |format|
			if @listing.save
        @listing.categories_list(params[:listing][:categories])
        flash[:notice] = "#{@listing.title} was created"
				format.html { redirect_to @listing }
			else
        flash[:alert] = @listing.errors.full_messages
				format.html {render :new }
			end
		end
  end

  def edit
    @listing = current_user.listings.find(params[:id])
  end

  def update
    @listing = current_user.listings.find(params[:id])
    if @listing.update(listing_params)
      @listing.categories_list(params[:listing][:categories])
      redirect_to current_user.listings.find(params[:id])
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

  def find_business_from_listing
    User.find_by(id: current_listing)
  end

  def listing_params
    	params.require(:listing).permit(:title,
																	    :description,
																	    :pay_rate,
                                      :employment_type,
                                      :number_of_positions,
                                      :closing_date,
                                      :categories_list,
                                      :location_city,
                                      :location_state,
                                      :creator_id)
  end

  def categories
    @categories = Listing.categories
  end
end
