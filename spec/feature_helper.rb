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

  def default_business_user
    business = User.create( company_name:         "Turing",
                        first_name:           "Jeff",
                        last_name:            "Casimir",
                        email:                "jeff@turing.com",
                        password:             "password",
                        password_confirmation:"password")
  end

  def default_applicant
    user = User.create( first_name: "Jon",
                        last_name: "Doe",
                        email: "jd@example.com",
                        password: "password",
                        password_confirmation: "password")
  end

  def default_job_listing
        listing = Listing.create( title: "Pastry Chef",
                              description: "Kneads the Dough",
                              pay_rate: "35000/yr",
                              employment_type: "Full-time",
                              number_of_positions: 2,
                              closing_date: Time.now + 1000,
                              creator_id: default_business_user.id)
  end