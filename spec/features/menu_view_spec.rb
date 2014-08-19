require 'feature_helper'

describe "menu", type: :feature do
  before(:each) do
    Item.create(title:"Chocolate yummy yumm", description: "Chocolate so good you'll wanna slap yo mama", price: 400, image: "icecreamslug.com", status: "active")
    Item.create(title:"Vanilla willya please", description: "Vanilla is the bomb for you mom!", price: 325, image: "icecreamslug.com", status: "active")
    Item.create(title:"Strawberry berry tasty", description: "Strawbeeeeeerrrry! Is good for me!", price: 450, image: "icecreamslug.com", status: "active")

    @items =  Item.all
    visit items_path
  end

  it "shows the items to a user" do
    @items.each do |item|
      expect(page).to have_content(item.title)
    end
  end

  it 'has an add to cart button' do
    within("//table") do
      @items.each do |item|
        expect(page).to have_button('Add to Cart')
      end
    end
  end

  it 'adds an item to the cart' do
    item = @items.first
    within("//table") do
      first(:button, 'Add to Cart').click
    end
    # visit cart_path(orders/show)
    # expect(page).to have_content(item)
  end
end
