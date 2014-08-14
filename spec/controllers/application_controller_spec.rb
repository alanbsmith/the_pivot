# Getting an order
#   When you visit the site,
#   you will be given an order if you don't have one

require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
    controller do
      def index
        render nothing: true
      end
    end

  describe 'Getting a user' do
    context 'unauthenticated user' do
    end

    context 'authenticated user' do
    end

    # Need to consider what it means when
    #   unregistered user logs in,
    #   and when unregistered user registers
  end


  describe "Getting a cart" do
    context 'unauthenticated user' do
      it 'gives them an in-memory cart when they visit the site' do
        expect(session).to be_empty
        get :index
        expect(session[:cart]).to eq Hash.new
      end

      it 'rebuilds the cart and order items, in memory, from the session' do
        item           = Item.create!
        session[:cart] = {item.id => 2}
        order_items    = controller.cart.order_items
        expect(order_items.size).to eq 1
        expect(order_items.first.item).to eq item
      end
    end

    context 'authenticated user' do
      it 'finds their existing cart'
      it 'makes thema a new cart if they do not have any open orders'
      it 'translates session cart data onto their cart and removes it from the session'
    end
  end
end

