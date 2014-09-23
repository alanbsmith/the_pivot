require 'feature_helper'

describe 'the business user view', type: :feature do

  describe 'new user can register a business' do
    before do
      listing = default_job_listing
      listing.categories.create(title: 'Bakery')

      default_business_user
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
      business_user = User.new
        business_user.company_name          = "FedEx"
        business_user.first_name            = "Fred"
        business_user.last_name             = "Rex"
        business_user.email                 = "fredrexfedex.com"
        business_user.password              = "password"
        business_user.password_confirmation = "password"
        business_user.save

      visit signin_path
      expect(current_path).to eq(signin_path)
 
        within('//form') do
          fill_in("session_email",    with: business_user.email)
          fill_in("session_password", with: "password")
          click_button("Sign In")
        end
      expect(current_path).to eq sessions_path
    end
  end

  describe 'business user can CRUD a new listing' do
    
    before(:each) do
      @job = default_job_listing
      @category1 = Category.create( title:("Things"), 
                                    description:("Do some stuff"))
      @category1.listings << @job
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
      page.click_button "Submit"
      expect(page).to have_content("real barista")
    end

    def user_register_a
      page.visit root_path
      page.click_link "Register Now"
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
      page.click_button "Submit"
    end

    it 'can edit a listing' do
      visit listings_path
      page.click_link("Read more...")
      expect(page).to have_link("Edit")

      click_link("Edit")
    end


    it 'can delete a listing' do
      page.visit listing_path(@job)

      expect(page).to have_content(@job.title)
      page.click_on "Delete this listing"
      page.visit listings_path
      expect(page).not_to have_content(@job.title)
    end

    it 'can log in as business' do
      visit signin_path
        within('//form') do
          fill_in("session_email", with: User.last.email)
          fill_in("session_password", with: "password")
          click_button("Sign In")
        end
      expect(current_path).to eq user_path(User.last)
    end

    it 'cannot see the apply for job button when vieiwing a job' do
      visit signin_path
        within('//form') do
          fill_in("session_email", with: User.last.email)
          fill_in("session_password", with: "password")
          click_button("Sign In")
        end
      visit listing_path(Listing.last)
      expect(page).to_not have_content('Apply')
    end

    # it 'cannot see the Your Cart in the menu if they are logged in' do
    #   visit signin_path
    #     within('//form') do
    #       fill_in("session_email", with: User.last.email)
    #       fill_in("session_password", with: "password")
    #       click_button("Sign In")
    #     end
    #     save_and_open_page
    #   expect(page).to_not have_content('Your Jobs')
    # end

    it 'cannot see Apply for Job from the listings page' do
      visit signin_path
        within('//form') do
          fill_in("session_email", with: User.last.email)
          fill_in("session_password", with: "password")
          click_button("Sign In")
        end
      visit listings_path
      expect(page).to_not have_content("Apply for this job!")
    end
  end
end
