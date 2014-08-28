require 'feature_helper'

describe 'checking out' do
  let(:user) { FactoryGirl.create(:user) }
  let(:cart) { FactoryGirl.create(:cart) }

  before(:each) do
    category = FactoryGirl.create(:category)
    @item = FactoryGirl.create(:item)
  end

  context 'the user is not signed in' do

    context 'the cart is empty' do
      it 'redirects to items' do
        visit cart_path(cart)

        click_on("Checkout")

        expect(current_path).to eq(items_path)
      end
    end

    context 'the cart is not empty' do
      it 'creates a new cart' do
        visit items_path

        click_on('Add To Cart')

        expect(current_path).to eq(items_path)

        click_on('Cart')

        expect(page).to have_content(@item.title)

        click_on("Checkout")

        expect(current_path).to eq(signin_path)

        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Signin"

        expect(page).to have_content("Monkey")

        expect(page).to have_button("Complete Order")
      end
    end
  end

  context 'the user is signed in' do
    context 'the cart is empty' do
      it 'redirects to items' do
        visit cart_path(cart)

        click_on("Checkout")

        expect(current_path).to eq(items_path)
      end
    end

    context 'the cart is not empty' do
      before do
        visit signin_path
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Signin"
      end

      it 'creates a new cart' do
        visit items_path

        click_on('Add To Cart')

        expect(current_path).to eq(items_path)

        click_on('Cart')

        click_on("Checkout")

        expect(page).to have_button("Complete Order")

      end

    end
  end
end
