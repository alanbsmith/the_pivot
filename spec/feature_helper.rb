require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

 def default_login
    click_link('Sign In')
    expect(current_path).to eq(signin_path)
    fill_in("session_email", with: "user@example.com")
    fill_in("session_password", with: "userpassword")
    click_button('Sign In')
  end