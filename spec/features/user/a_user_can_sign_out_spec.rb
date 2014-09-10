require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

user = User.new
  user.first_name            = "Jon"
  user.last_name             = "Doe"
  user.email                 = "jd@example.com"
  user.password              = "password"
  user.password_confirmation = "password"
  user.save


describe 'user', type: :feature do

  before do
    visit '/signin'
    fill_in "Email", with: "jd@example.com"
    fill_in "Password", with: "password"
    click_on "Signin"
  end

  it 'signs out of their account' do
    click_on "Signout"

    expect(page).to have_link("Sign In")
    expect(page).to_not have_content("Signout")
    expect(current_path).to eq(root_path)
  end
end
