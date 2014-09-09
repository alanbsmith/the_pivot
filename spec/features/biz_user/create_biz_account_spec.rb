require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'biz_user', type: :feature do

  it 'create an account redirecting to dashboard' do
    visit '/register'

    fill_in  "Company name",          with: "Apple"
    fill_in  "Email",                 with: "steve@example.com"
    fill_in  "First name",            with: "Steve"
    fill_in  "Last name",             with: "Jobs"
    fill_in  "Username",              with: "steve"
    fill_in  "Password",              with: "password"
    fill_in  "Password confirmation", with: "password"
    click_on "Create User"

    expect(current_path).to eq(business_users_path)
  end

end
