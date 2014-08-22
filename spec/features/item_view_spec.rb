require 'feature_helper'

describe 'the item view' do
  before(:each) do
    @item1 = Item.create(title:"Chocolate yummy yumm", description: "Chocolate so good you'll wanna slap yo mama", price: 400, image: "icecreamslug.com", status: 1)
    @item2 = Item.create(title:"Vanilla willya please", description: "Vanilla is the bomb for you mom!", price: 325, image: "icecreamslug.com", status: 1)
    
    visit item_path(@item1)
  end

  it 'should show the item' do
    expect(page).to have_content(@item1.title)
  end

end
