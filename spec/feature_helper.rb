require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

  def default_login
    user = default_applicant
    click_link('Sign In')
    expect(current_path).to eq(signin_path)
    fill_in("session_email",    with: user.email)
    fill_in("session_password", with: user.password)
    click_button('Sign In')
  end

  def default_business_user
    business = User.create( company_name:         "Turing",
                            first_name:           "Jeff",
                            last_name:            "Casimir",
                            email:                "jeff@turing.com",
                            password:             "password",
                            password_confirmation:"password")
  end

  def default_applicant
    user = User.create( first_name: "Jon",
                        last_name: "Doe",
                        email: "jd@example.com",
                        password: "password",
                        password_confirmation: "password")
  end

  def default_job_listing
    @business  = default_business_user
    listing   = Listing.create( title: "Pastry Chef",
                              description: "Kneads the Dough",
                              pay_rate: "35000/yr",
                              employment_type: "Full-time",
                              number_of_positions: 2,
                              closing_date: Time.now + 1000,
                              creator_id: @business.id,
                              location_city: "Denver",
                              location_state: "CO")
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
    page.fill_in      "Title",                  with: "barista"
    page.fill_in      "Description",            with: "Grinding dem beans"
    page.fill_in      "Pay rate",               with: "8.00/hr"
    page.fill_in      "listing_location_city",  with: "Waco"
    page.fill_in      "listing_location_state", with: "TX"
    page.choose       "part-time"

    page.click_button "Submit"
  end
