class ListingsController < ApplicationController
  def new
    @listing    = Listing.new
    @categories = Category.all
  end

  def index
    @listings   = Listing.all
    @categories = Category.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
		@listing = Listing.new(listing_params)
    respond_to do |format|
			if @listing.save
        @listing.categories_list(params[:listing][:categories])
        flash[:alert] = "#{@listing.title} was created"
				format.html { redirect_to @listing }

			else
        flash[:alert] = @listing.errors.full_messages
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
      @listing.categories_list(params[:listing][:categories])
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
                                      :employment_type,
                                      :number_of_positions,
                                      :business_id,
                                      :closing_date,
                                      :categories_list)
  end

  def categories
    @categories = Listing.categories
  end
end
