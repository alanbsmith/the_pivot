require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'


describe 'user', type: :feature do

  it 'I can create a new listing' do
    page.visit new_listing_path
    page.fill_in      "Title",       with: "barista"
    page.fill_in      "Description", with: "Grinding dem beans"
    page.fill_in      "Pay rate",    with: "8.00/hr"
    page.choose       "part-time"
    page.click_button "Submit"
    save_and_open_page
    expect(page).to have_content("barista")
  end

  xit "A user can edit its own listings" do
    user_create
    user_signin
    page.visit new_listing_path
    page.fill_in "Title", with: "Barista"
    page.fill_in "Description", with: "Grinding dem beans"
    page.fill_in "Pay rate", with: "8.00/hr"
    page.choose "part-time"
    page.click_button "Submit"
    page.visit listings_path
    expect(page).to have_content("Job")
  end

  def user_create
    user = User.new
    user.first_name            = ""
    user.last_name             = "Doe"
    user.email                 = "jd@example.com"
    user.password              = "password"
    user.password_confirmation = "password"
    user.save
  end

  def user_signin
    page.visit '/signin'
    page.fill_in "session_email", with: "jd@example.com"
    page.fill_in "session_password", with: "password"
    page.click_link "Sign In"
  end

end
