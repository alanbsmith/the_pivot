class ItemsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @categories = Category.all
    @user       = User.find_by(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find_by(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title,
                                 :description,
                                 :price,
                                 :image,
                                 :status,
                                 :categories_list)
  end

  def lookup_item
    @item = Item.find(params[:id])
  end
end
