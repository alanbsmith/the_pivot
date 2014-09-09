require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

user = User.new
  user.first_name            = "Jon"
  user.last_name             = "Doe"
  user.email                 = "a@example.com"
  user.password              = "password"
  user.password_confirmation = "password"
  user.save


describe 'user', type: :feature do

  it 'logs in to their account' do
    visit '/signin'

    fill_in "Email", with: "a@example.com"
    fill_in "Password", with: "password"
    click_on "Signin"

    expect(current_path).to eq(home_path)
  end
end
