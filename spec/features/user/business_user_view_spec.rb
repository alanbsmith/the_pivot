require 'feature_helper'

describe 'the business user view', type: :feature do

  describe 'home view' do
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

        user = User.new
          user.company_name          = "FedEx"
          user.first_name            = "Fred"
          user.last_name             = "Rex"
          user.email                 = "fredrex@fedex.com"
          user.password              = "password"
          user.password_confirmation = "password"
        user.save

    end

        it 'has link to register a business' do
          visit home_path
          expect(page).to have_link('Register Now')
        end

        it 'displays the business registration page' do
          visit home_path
          click_link('Register Now')
          expect(current_path).to eq(new_user_path)
        end

        it 'can register a business' do
          visit home_path
          click_link('Register Now')
          expect(current_path).to eq(new_user_path)
          fill_in("Company name", with: "FedEx")
          fill_in("email", with: "user@example.com")
          fill_in("First Name", with: "Bob")
          fill_in("Last Name", with: "Gu")
          fill_in("Password", with: "password")
          fill_in("Confirmation", with: "password")
          click_button("Register Now")
          expect(current_path).to eq user_path(User.last)
        end

        it 'can log in as business' do
          visit signin_path
            within('//form') do
              fill_in("session_email", with: User.last.email)
              fill_in("session_password", with: "password")
              click_button("Sign In")
            end
          expect(current_path).to eq user_path(User.last)
        end

        it 'cannot see the apply for job button when vieiwing a job' do
          visit listings_path(Listing.last)
          expect(page).not_to have_content('Apply')
        end
      end
    end
