class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @business   = User.find_by(id: listing.creator_id)
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.create(category_params)

    if @category.save
      flash.notice = "A new category: '#{@category.title}' was successfully created"
      redirect_to administrator_categories_path
    else
      format.html { render :new, alert: 'Fill in all of the fields before submitting'}
    end
  end

  private

  def find_business_from_listing
    User.find_by(id: @current_listing_id)
  end

  def category_params
    params.require(:category).permit(:title,
                                     :description)
  end
end
