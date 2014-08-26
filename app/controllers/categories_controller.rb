class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    @category.save

    flash.notice = "A new category: '#{@category.title}' was successfully created"
    redirect_to administrator_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title,
                                     :description)
  end
end
