class Administrator::ItemsController<ActionController::Base
  def index
    @items = Item.all
  end

  def edit
  end

  def retire
    # don't forget to create the notice
  end
end
