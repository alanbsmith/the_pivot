require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'cart', type: :feature do

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
    @listing = listing
    visit listings_path
  end

  it 'can view listings by category' do
    expect(page).to have_content('Bakery')

    click_link('Bakery')
    expect(page).to have_content(@listing.title)
    expect(page).to have_content(@listing.description)
    expect(page).to have_link('Read more...')
    expect(page).to have_button('Apply for this job!')
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
      visit listings_path
      click_button("Apply for this job!")
      expect(page).to have_content("Pastry Chef has been added to your cart")
      click_link("Your Jobs")
    end

    it 'can add listings to their cart' do
      expect(page).to have_content(@listing.title)
    end

    it 'cannot add multiples of the same listing to their cart' do
      visit listings_path
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
      expect(page).to have_content("Your cart is now empty.")

      click_link("Your Jobs")
      expect(page).to_not have_content("Pastry Chef")
    end
  end

  it 'lists its number of jobs in the menu' do
    visit listings_path
    expect(page).to have_content(0)
    click_button("Apply for this job!")
    expect(page).to have_content(1)
    click_link("Your Jobs")
    click_link("Remove this job")
    expect(page).to have_content(0)
  end
end
