class ItemsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @items = Item.where(status: 1)
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
  end

  private
    def item_params
<<<<<<< HEAD
      params.require(:item).permit(:title, 
                                   :description, 
                                   :price, 
                                   :image, 
=======
      params.require(:item).permit(:title,
                                   :description,
                                   :price,
                                   :image,
>>>>>>> 0dd7fb5229f1534176acd29ea3daa833be575c99
                                   :status,
                                   :categories_list)
    end

    def lookup_item
      @item = Item.find(params[:id])
    end
end
