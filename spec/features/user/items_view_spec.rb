require 'feature_helper'

describe "menu", type: :feature do
  before(:each) do
    category = FactoryGirl.create(:category)
    @item    = Item.find(1)
    visit items_path
  end

  it "shows the items to a user" do
    expect(page).to have_content(@item.title)
  end

  it "has a link to show the item" do
    click_link('Chocolate Dream')
    expect(current_path).to eq(item_path(@item))
  end

  it 'has an add to cart button' do
    within("//table") do
      expect(page).to have_button('Add To Cart')
    end
  end
end
