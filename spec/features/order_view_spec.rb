require 'feature_helper'

RSpec.describe "the order view", type: :feature do
    let(:order) { Order.create(user_id: 1, status:"Pickup") }

  describe "items" do
    before(:each) do
      order.items.create(title: "tangerine",
      price: 5.25)
      order.items.create(title: "mango",
      price: 5.25)
      visit order_path(order)
    end



    it "shows the items for an order" do
      order.items.each do |item|
        expect(page).to have_content(item.title)
        expect(page).to have_content('$5.25')
      end
    end



  end
end
