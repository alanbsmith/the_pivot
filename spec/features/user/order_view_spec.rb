require 'feature_helper'

describe "the order view", type: :feature do

  context 'user is signed in' do

    before(:each) do
      @default_user = User.create(email: "user@example.com", password: "userpassword", password_confirmation: "userpassword",
                        first_name: "user", last_name: "whatever")

      @order  = User.find_by(email: "user@example.com").orders.create(user_id: @default_user.id)

      category = FactoryGirl.create(:category)
      listing  = FactoryGirl.create(:listing)

      @job     = listing

      visit home_path
    end

    it 'cannot apply without jobs in the cart' do
      default_login
      visit cart_path

      expect(page).to have_content('There are currently no jobs in your cart!')
      
      expect(page).to_not have_content(@job.title)
      expect(page).to_not have_content(@job.description)
      expect(page).to_not have_button('Remove this job')
    end

    it 'creates an application' do
      default_login
      expect(current_path).to eq("/users/#{@default_user.id}")

      visit listings_path
      click_on('Apply for this job!')
      click_on('Your Jobs')
      click_on('Apply')
      click_on('Complete Order')
      click_on('Dashboard')
      click_on('Previous Applications')

      expect(page).to have_content('Worker')
      click_on('Worker')

      expect(page).to have_content('Do work son')
    end

    it 'can view its previous applications' do
      default_login
      
      click_on('Previous Applications')
      expect(current_path).to eq(orders_path)
    end
  end

  context 'user is not signed in' do
    it 'goes to menu when they try to access orders' do
      visit orders_path
      expect(current_path).to eq(listings_path)
    end
  end
end