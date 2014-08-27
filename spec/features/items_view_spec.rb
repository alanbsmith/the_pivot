require 'feature_helper'

describe "menu", type: :feature do
  before(:each) do
    category1 = Category.create(title:"Chocolate", description:"Who doesn't like chocolate? Hilter that's who.")
    category2 = Category.create(title:"Vanilla", description: "It's not as boring as white people")
    category3 = Category.create(title:"Strawberry", description: "This counts as a fruit right?")

    @categories = Category.all
    @category   = Category.first

    item1 =Item.create(title:"Chocolate yummy yumm", description: "Chocolate so good you'll wanna slap yo mama", price: 400, image: "icecreamslug.com", status: 1)
    item2 =Item.create(title:"Vanilla willya please", description: "Vanilla is the bomb for you mom!", price: 325, image: "icecreamslug.com", status: 1)
    item3 =Item.create(title:"Strawberry berry tasty", description: "Strawbeeeeeerrrry! Is good for me!", price: 450, image: "icecreamslug.com", status: 1)

    @items = Item.all
    @item  = Item.first

    category1.items << item1
    category2.items << item2
    category3.items << item3

    visit items_path
  end

  it "shows the items to a user" do
    @items.each do |item|
      expect(page).to have_content(item.title)
    end
  end

  it "has a link to show the item" do
    click_link('Chocolate yummy yumm')
    expect(current_path).to eq(item_path(@item))
  end

  it 'has an add to cart button' do
    within("//table") do
      @items.each do |item|
        expect(page).to have_button('Add To Cart')
      end
    end
  end

  it 'adds an item to the cart' do
    item = @items.first
    within("//table") do
      # first(:button, 'Add to Cart').click
    end

    # order = Order.create(status: "Open")
    # visit order_path(order.id)
    # expect(page).to have_content(order.order_items.first)
  end
end
