class Administrator::ItemsController < ApplicationController
  before_action :lookup_item, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def update
    @item.update(item_params)

    flash.notice = "Item: '#{@item.title}' has been updated"
    redirect_to administrator_items_path
  end

  def destroy
    # add a transaction method so that an active item cannot be destroyed
    # write a test to support this use, once you have the basic use working!
        # @item.transaction do
        #   @item.retired
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

    def lookup_item
      @item = Item.find(params[:id])
    end
end