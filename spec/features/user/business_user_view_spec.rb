require 'feature_helper'

describe 'the business user view', type: :feature do

  describe 'new user can register a business' do
    before do
        listing = Listing.new
        listing.title                = "Pastry Chef"
        listing.description          = "Kneads the Dough"
        listing.pay_rate             = 35000
        listing.employment_type      = "Full-time"
        listing.number_of_positions  = 2
        listing.closing_date         = Time.now + 1000
        listing.save

        listing.categories.create(title: 'Bakery')

        user = User.new
          user.company_name          = "FedEx"
          user.first_name            = "Fred"
          user.last_name             = "Rex"
          user.email                 = "fredrex@fedex.com"
          user.password              = "password"
          user.password_confirmation = "password"
        user.save
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
        business_user.email                 = "fredrex@fedex.com"
        business_user.password              = "password"
        business_user.password_confirmation = "password"
        business_user.save

      visit signin_path
      expect(current_path).to eq(signin_path)
        within('//form') do
          fill_in("session_email",    with: "fredrex@fedex.com")
          fill_in("session_password", with: "password")
          click_button("Sign In")
        end
      expect(current_path).to eq user_path(User.last)
    end
  end

  describe 'business user can CRUD a new listing' do

    before(:each) do
      @job = Listing.create( title:("Doer"),
                             description:("Doing things"),
                             pay_rate:("1.00/hr"),
                             employment_type:("part time"),
                             closing_date:(Time.now + 1000))

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
      page.click_button "Create Listing"
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
      page.click_button "Create Listing"
    end

    it 'can edit a listing' do
      visit listings_path
      page.click_link("Read more...")
      expect(page).to have_link("Edit")

      click_link("Edit")
    end


    it 'can delete a listing' do
      page.visit listing_path(@job)

      expect(page).to have_content('Doer')
      page.click_on "Delete this listing"
      page.visit listings_path
      expect(page).not_to have_content("Doer")
    end

    let(:user) do
      user = User.create!(
        :company_name          => "FedEx",
        :first_name            => "Fred",
        :last_name             => "Rex",
        :email                 => "fredrex@fedex.com",
        :password              => "password",
        :password_confirmation => "password"
      )
    end

    it 'can log in as business' do
      visit signin_path
        within('//form') do
          fill_in("session_email", with: "fredrex@fedex.com")
          fill_in("session_password", with: "password")
          click_button("Sign In")
        end
      expect(current_path).to eq sessions_path
    end

    it 'cannot see the apply for job button when vieiwing a job' do
      visit signin_path
        within('//form') do
          fill_in("session_email", with: "fredrex@fedex.com")
          fill_in("session_password", with: "password")
          click_button("Sign In")
        end
      visit listing_path(Listing.last)
      expect(page).to_not have_content('Apply')
    end

  

    it 'cannot see Apply for Job from the listings page' do
      visit signin_path
        within('//form') do
          fill_in("session_email", with: "fredrex@fedex.com")
          fill_in("session_password", with: "password")
          click_button("Sign In")
        end
      visit listings_path
      expect(page).to_not have_content("Apply for this job!")
    end
  end
end
