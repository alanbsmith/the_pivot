require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'user', type: :feature do

  before do
    
    listing  = default_job_listing
    @listing = listing
    listing.categories.create(title: 'Bakery')

    user  = default_applicant
    @user = user

    default_business_user

    page.visit '/signin'
    page.fill_in "session_email",    with: "jd@example.com"
    page.fill_in "session_password", with: "password"
    page.click_button "Log In"
  end

  it 'expects to see a job in their dashboard after applying' do
    visit listing_path(@listing)
    click_button("Apply for this job!")
    expect(page).to have_content("Pastry Chef has been added to your cart.")

    click_link("your_jobs_link")
    page.click_link('Apply')
    page.visit cart_path(@user_id)
    expect(page).to have_link("Pastry Chef")
  end
end
