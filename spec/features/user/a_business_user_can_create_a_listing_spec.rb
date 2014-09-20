require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'


describe 'user', type: :feature do

  it 'I can create a new listing' do
    user_register_a
    add_listing
    expect(page).to have_content("barista")
  end

  it "A user can edit its own listings" do
    user_register_a
    add_listing
    expect(page).to have_content("barista")
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



end
