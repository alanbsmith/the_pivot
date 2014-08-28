require 'rails_helper'

RSpec.describe CartItem, :type => :model do
  describe 'total price' do
    before(:each) do
      item = FactoryGirl.create(:item)
      # there are 3 items
      @cart_item = FactoryGirl.create(:cart_item)
    end
   it 'calculates the total price of items ' do
     expect(@cart_item.total_price).to eq(19.50)
   end
 end
end
