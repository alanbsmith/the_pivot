require 'feature_helper'

describe "the order view", type: :feature do

  context 'user is signed in' do

    before(:each) do
      @user  = default_applicant
      @order = User.find_by(email: @user.email).orders.create(user_id: @user.id)

      @listing  = default_job_listing
      # @listing = listing

      category = FactoryGirl.create(:category)
      visit home_path
    end

    it 'cannot apply without jobs in the cart' do
      default_login
      visit cart_path

      expect(page).to have_content('There are currently no jobs in your cart!')
      expect(page).to_not have_content(@listing.title)
      expect(page).to_not have_content(@listing.description)
      expect(page).to_not have_button('Remove this job')
    end

    it 'creates an application' do

      default_login
      expect(current_path).to eq("/users/#{@user.id}")
      visit listings_path
      click_on(@listing.title)
      click_on('Add this Job')
      click_on('your_jobs_link')
      click_on('Apply')
      click_on('Apply')
      expect(page).to have_content('Thanks for your submission!')

      visit user_path(@user)
      click_on('Previous Applications')

      expect(page).to have_content(@listing.title)
      click_on(@listing.title)

      expect(page).to have_content(@listing.description)
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
