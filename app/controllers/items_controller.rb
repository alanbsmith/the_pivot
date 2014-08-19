class ItemsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.save

    if @item.save
      respond_with @item, location: administrator_items_url
      flash.notice = "A new item: '#{@item.title}' was successfully created"
    else
      flash[:notice] = "Not Saved"
    end
    # redirect_to administrator_items_path
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
