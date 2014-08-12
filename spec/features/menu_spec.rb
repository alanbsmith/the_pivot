require 'feature_helper'

Rspec.describe "menu" type: feature do
  before(:each) do
      assign(:items, [Items.create(title:"Chocolate yummy yumm", description: "Chocolate so good you'll wanna slap yo mama", price: 400, photo: "icecreamslug.com", status: "active"), 
                      Items.create(title:"Vanilla willya please", description: "Vanilla is the bomb for you mom!", price: 325, photo: "icecreamslug.com", status: "active"),
                      Items.create(title:"Strawberry berry tasty", description: "Strawbeeeeeerrrry! Is good for me!", price: 450, photo: "icecreamslug.com", status: "active")
                      ])
    end
  
  it "shows the items to a user" do
    items.each do |item|
      expect(page).to have_content(item.title)
    end
  end

  it 'has an add to cart button' do
    
  end

  it 'adds an item to the cart' do
  
  end
end