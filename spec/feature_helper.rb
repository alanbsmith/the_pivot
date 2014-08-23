require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

# @admin_user = User.create(email: "admin@example.com", password: "adminpassword", password_confirmation: "adminpassword",
#                     first_name: "admin", last_name: "whatever", role: "admin")


@default_user = User.create(email: "user@example.com", password: "userpassword", password_confirmation: "userpassword",
                  first_name: "user", last_name: "whatever", role: "default"
)


  def admin_login
    click_link('Sign In')
    expect(current_path).to eq(signin_path)
    fill_in("Email", with: "admin@example.com")
    fill_in("Password", with: "adminpassword")
    click_button('Signin')
  end

  def default_login
    click_link('Sign In')
    expect(current_path).to eq(signin_path)
    fill_in("Email", with: "user@example.com")
    fill_in("Password", with: "userpassword")
    click_button('Signin')
  end
