class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    
    if @item.save
     respond_with @item, location: menu_items_url
    else
     flash[:notice] = "Not Saved"
    end
    # flash.notice = "A new item: '#{@item.title}' was successfully created"
    redirect_to administrator_items_path
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

    def set_item
      @item = Item.find(params[:id]) 
    end

    def lookup_item
      @item = Item.find(params[:id])
    end
end
