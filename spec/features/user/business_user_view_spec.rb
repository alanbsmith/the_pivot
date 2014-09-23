require 'feature_helper'

describe 'the business user view', type: :feature do
  before do
    @business_user = default_business_user
  end

  describe 'new user can register a business' do
    before do
      listing = default_job_listing
      listing.categories.create(title: 'Bakery')

      default_business_user

      listing.categories.create(title: 'Bakery')
    end

    it 'has link to register a business' do
      visit home_path
      expect(page).to have_link('Register Now')
    end

    it 'displays the business registration page' do
      visit home_path
      click_link('Register Now')
      expect(current_path).to eq(new_user_path)
    end

    it 'can register a business' do
      visit home_path
      click_link('Register Now')
      expect(current_path).to eq(new_user_path)
      fill_in("Company name", with: "FedEx")
      fill_in("email", with: "user@example.com")
      fill_in("First Name", with: "Bob")
      fill_in("Last Name", with: "Gu")
      fill_in("Password", with: "password")
      fill_in("Confirmation", with: "password")
      click_button("Register Now")
      expect(current_path).to eq user_path(User.last)
    end

    it 'can log in as business' do
      visit signin_path
      expect(current_path).to eq(signin_path)

        within('//form') do
          fill_in("session_email",    with: @business_user.email)
          fill_in("session_password", with: @business_user.password)
          click_button("Sign In")
        end
      expect(current_path).to eq user_path(@business_user)
    end
  end
end
