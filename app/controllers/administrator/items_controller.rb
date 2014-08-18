class Administrator::ItemsController < ApplicationController
  before_action :lookup_item, only: [:show, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def show
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

  def edit
  end

  def update
    @item.update(item_params)

    flash.notice = "Item: '#{@item.title}' has been updated"
    redirect_to administrator_items_path
  end

  def retire
    # don't forget to create the notice
  end

  def destroy
    # add a transaction method so that an active item cannot be destroyed
    # write a test to support this use, once you have the basic use working!
        # @item.transaction do
        #   @item.status == "retired"
        #   @item.destroy
        # end
    @item.destroy

    respond_to do |format|
      format.html { redirect_to administrator_items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
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