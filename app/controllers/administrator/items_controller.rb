class Administrator::ItemsController<ActionController::Base
  before_action :lookup_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    
    flash.notice = "A new item: '#{@item.title}' was successfully created"
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
end

  private
    def item_params
      params.require(:item).permit(:title, 
                                   :description, 
                                   :price, 
                                   :photo, 
                                   :status, 
                                   :categories_list)
    end

    def lookup_item
      @item = Item.find(params[:id])
    end