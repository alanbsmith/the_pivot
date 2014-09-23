require 'feature_helper'

describe 'the business user view', type: :feature do
  before do
    @business_user = default_business_user
  end

  describe 'new user can register a business' do
    before do
      listing  = default_job_listing
      listing.categories.create(title: 'Bakery')

      default_business_user

      listing.categories.create(title: 'Bakery')
    end

    it 'has link to register a business' do
      visit home_path
      expect(page).to have_link('Register')
    end

    it 'displays the business registration page' do
      visit home_path
      click_link('Register')
      expect(current_path).to eq(new_user_path)
    end

    it 'can register a business' do
      visit home_path
      click_link('Register')
      expect(current_path).to eq(new_user_path)
      fill_in("Company name", with: "FedEx")
      fill_in("email", with: "user@example.com")
      fill_in("First Name", with: "Bob")
      fill_in("Last Name", with: "Gu")
      fill_in("Password", with: "password")
      fill_in("Confirmation", with: "password")
      click_button("Register")
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

  describe 'business user can CRUD a new listing' do

    before(:each) do
      lisiting = default_job_listing
      @listing = listing

      @category1          = Category.create( title:("Things"), description:("Do some stuff"))
      @category1.listings << listing
    end

    it 'I can create a new listing' do
      user_register_a
      add_listing
      expect(page).to have_content("barista")
    end

    it "A user can edit its own listings" do
      user_register_a
      add_listing
      expect(page).to have_content("barista")
      page.click_link "Edit"
      page.fill_in "Title", with: "real barista"
      page.click_button "Create Listing"
      expect(page).to have_content("real barista")
    end

    def user_register_a
      page.visit root_path
      page.click_link "Register"
      page.fill_in "user_company_name", with: "Apple Incorporated"
      page.fill_in "user_first_name", with: "Steve"
      page.fill_in "user_last_name", with: "Jobs"
      page.fill_in "user_email", with: "steve@example.com"
      page.fill_in "user_password", with: "password"
      page.fill_in "user_password_confirmation", with: "password"
      page.click_button "register_now_btn"
    end

    def add_listing
      page.click_link "add-job-listing"
      page.fill_in      "Title",       with: "barista"
      page.fill_in      "Description", with: "Grinding dem beans"
      page.fill_in      "Pay rate",    with: "8.00/hr"
      page.choose       "part-time"
      page.click_button "Create Listing"
    end

    it 'can edit a listing' do
      visit listings_path
      page.click_link("Read more...")
      expect(page).to have_link("Edit")
      click_link("Edit")
      save_and_open_page
      expect(current_path).to eq
    end


    it 'can delete a listing' do
      page.visit listing_path(@listing)

      expect(page).to have_content(@listing.title)
      page.click_on "Delete this listing"
      page.visit listings_path
      expect(page).not_to have_content(@listing.title)
    end

    # let(:user) do
    #   user = User.create!(
    #     :company_name          => "FedEx",
    #     :first_name            => "Fred",
    #     :last_name             => "Rex",
    #     :email                 => "fredrex@fedex.com",
    #     :password              => "password",
    #     :password_confirmation => "password"
    #   )
    # end

    it 'can log in as business' do
      visit signin_path
        within('//form') do
          fill_in("session_email",    with: @business.email)
          fill_in("session_password", with: @business.password)
          click_button("Log In")
        end
      expect(current_path).to eq sessions_path
    end

    it 'cannot see the apply for job button when vieiwing a job' do
      visit signin_path
        within('//form') do
          fill_in("session_email",    with: @business_user.email)
          fill_in("session_password", with: @business_user.password)
          click_button("Log In")
        end
      visit listing_path(@listing)
      expect(page).to_not have_content('Apply')
    end

    it 'cannot see Apply for Job from the listings page' do
      visit signin_path
        within('//form') do
          fill_in("session_email",    with: @business_user.email)
          fill_in("session_password", with: @business_user.password)
          click_button("Log In")
        end
      expect(current_path).to eq user_path(@business_user)
    end
  end
end
