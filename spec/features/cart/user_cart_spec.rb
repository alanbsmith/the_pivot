require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

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
    
    expect(page).to have_content(@listing.title)
    expect(page).to have_content(@listing.description)
    expect(page).to have_link('Read more...')
  end

  it 'can view the details of a job listing' do
    expect(current_path).to eq(listings_path)
    click_link('Bakery')
    click_link('Read more...')

    expect(current_path).to eq(listing_path(@listing))
    expect(page).to have_content(@listing.title)
    expect(page).to have_content(@listing.description)
    expect(page).to have_content(@listing.pay_rate)
    expect(page).to have_content(@listing.employment_type)
    expect(page).to have_content(@listing.number_of_positions)
    expect(page).to have_content(@listing.closing_date)
  end

  context 'cart CRUD' do

    before(:each)do
      visit listing_path(@listing)
      click_button("Apply for this job!")
      expect(page).to have_content("Pastry Chef has been added to your cart")
      click_link("your_jobs_link")
    end

    it 'can add listings to their cart' do
      expect(page).to have_content(@listing.title)
    end

    it 'cannot add multiples of the same listing to their cart' do
      visit listing_path(@listing)
      click_button("Apply for this job!")
      expect(page).to have_content("This job is already in your cart")
    end

    it 'can upload a resume within the cart' do

    end

    it 'can remove items from their cart' do
      click_link("Remove this job")
      expect(page).to have_content("Listing was successfully removed form cart.")
      expect(page).to_not have_content(@listing.title)
    end

    it 'can empty their cart' do
      expect(page).to have_content("Pastry Chef")
      click_link("Empty Cart")
      expect(current_path).to eq(listings_path)
      expect(page).to_not have_content("You have")
    end
  end

  it 'lists its number of jobs in the menu' do
    visit listing_path(@listing)
    expect(page).to have_content(0)
    click_button("Apply for this job!")
    expect(page).to have_content(1)
    click_link("You have")
    click_link("Remove this job")
    expect(page).to_not have_content("You have")
  end
end
