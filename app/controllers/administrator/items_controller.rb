class Administrator::ItemsController<ActionController::Base
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    
  end

  def edit
  end

  def update

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