class Administrator::ItemsController < ApplicationController
  before_action :lookup_item, only: [:show, :edit, :update, :destroy]
  before_action :authorize?
  respond_to :html, :xml, :json

  def index
    @items = Item.all
    @user  = User.find_by(params[:id])
  end

  def new
    @item = Item.new
  end

  def show
  end

  def categories
    @categories = Item.categories
  end

  def create
    @item = Item.new(item_params)

    params[:categories_list][:id].each do |category|
      @item.categorizations.build(category_id: category)
    end

    @item.save

    flash.notice = "A new item: '#{@item.title}' was successfully created"
    redirect_to administrator_items_path
  end

  def edit
  end

  def update
    @item.update(item_params)

    # params[:categories_list][:id].each do |category|
    #   @item.categorizations.build(category_id: category)
    # end

    redirect_to administrator_items_path
  end

  def destroy
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

    def authorize?
      redirect_to("http://bringvictory.com/") unless current_user && current_user.role == "admin"
    end
end
