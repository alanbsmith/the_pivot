require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'cart', type: :feature do

  before (:each) do
    listing = Listing.new
    listing.title                = "Pastry Chef"
    listing.description          = "Kneads the Dough"
    listing.pay_rate             = 35000
    listing.employment_type      = "Full-time"
    listing.number_of_positions  = 2
    listing.closing_date         = Time.now + 1000
    listing.save

    listing.categories.create(title: 'Bakery')
  end

  it 'can add listings to their cart' do

    visit listings_path
    click_button("Add To Cart")
    expect(page).to have_content("Pastry Chef has been added to your cart")

    click_link("Your Cart")

    expect(page).to have_content("Pastry Chef")
  end

  it 'cannot add multiples of the same listing to their cart' do

    visit listings_path
    click_button("Add To Cart")
    expect(page).to have_content("Pastry Chef has been added to your cart")

    click_button("Add To Cart")
    expect(page).to have_content("This job is already in your cart")
  end
end
