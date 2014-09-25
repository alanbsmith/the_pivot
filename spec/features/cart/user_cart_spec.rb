require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'
require 'feature_helper'

describe 'cart', type: :feature do

  before do
    listing  = default_job_listing
    @listing = listing

    listing.categories.create(title: 'Bakery')
 default_business_user

    visit listings_path
  end

  it 'can view listings by category' do
    expect(page).to have_content('Bakery')

    click_link('Bakery')

    expect(page).to have_link(@listing.title)
    expect(page).to have_content(@listing.description)
  end

  it 'can view the details of a job listing' do
    expect(current_path).to eq(listings_path)
    click_link('Bakery')
    click_link(@listing.title)

    expect(current_path).to eq(listing_path(@listing))
    expect(page).to have_content(@listing.title)
    expect(page).to have_content(@listing.description)
    expect(page).to have_content(@listing.pay_rate)
    expect(page).to have_content(@listing.employment_type)
    expect(page).to have_content(@listing.number_of_positions)
    expect(page).to have_content(@listing.closing_date.strftime('%b %d, %Y'))
  end

  context 'cart CRUD' do

    before(:each)do
      visit listing_path(@listing)
      click_button("Add this Job")
      expect(page).to have_content("Pastry Chef has been added to your folder.")
      click_link("your_jobs_link")
    end

    it 'can add listings to their cart' do
      expect(page).to have_content(@listing.title)
    end

    it 'cannot add multiples of the same listing to their cart' do
      visit listing_path(@listing)
      click_button("Add this Job")
      expect(page).to have_content("This job is already in your folder")
    end

    it 'can remove items from their cart' do
      click_link("delete-x")
      expect(page).to have_content("Listing was successfully removed.")
      expect(page).to_not have_content(@listing.title)
    end
  end

  it 'lists its number of jobs in the menu' do
    visit listing_path(@listing)
    expect(page).to have_content(0)
    click_button("Add this Job")
    expect(page).to have_content(1)
    click_link("your_jobs_link")
    click_link("delete-x")
    expect(page).to_not have_content("You have")
  end
end
