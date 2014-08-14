require 'feature_helper'

RSpec.describe "the order view", type: :feature do
    let(:order) { Order.create(user_id: 1, status:"Pickup") }

  describe "items" do
    before(:each) do
      order.items.create(title: "tangerine",
      price: 1000)
      order.items.create(title: "mango",
      price: 1000)
      visit order_path(order)
    end


    it "shows the items for an order" do
      order.items.each do |item|
        expect(page).to have_content(item.title)
      end
    end
  end
end
