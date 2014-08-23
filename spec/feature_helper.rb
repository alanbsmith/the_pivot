require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

# @admin_user = User.create(email: "admin@example.com", password: "adminpassword", password_confirmation: "adminpassword",
#                     first_name: "admin", last_name: "whatever", role: "admin")

  def admin_login
    click_link('Sign In')
    expect(current_path).to eq(signin_path)
    fill_in("Email", with: "admin@example.com")
    fill_in("Password", with: "adminpassword")
    click_button('Signin')
  end
