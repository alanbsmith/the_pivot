require 'feature_helper'

describe 'the user view', type: :feature do

  describe 'home view' do

    context 'business users' do

        it 'has link to register a business' do
          visit home_path
          expect(page).to have_link('Register')
        end

        it 'displays the business registration page' do
          visit home_path
          click_link('Register')
          expect(current_path).to eq(new_user_path)
        end

        it 'can register a business' do
          visit home_path
          click_link('Register')
          expect(current_path).to eq(new_user_path)
          fill_in("Company name", with: "FedEx")
          fill_in("email", with: "user@example.com")
          fill_in("First Name", with: "Bob")
          fill_in("Last Name", with: "Gu")
          fill_in("Password", with: "password")
          fill_in("Confirmation", with: "password")
          click_button("Register")
          expect(current_path).to eq user_path(User.last)
        end

        it 'can log in as business' do
          user = User.new
            user.company_name          = "FedEx"
            user.first_name            = "Fred"
            user.last_name             = "Rex"
            user.email                 = "fredrex@fedex.com"
            user.password              = "password"
            user.password_confirmation = "password"
          user.save

          visit signin_path
          expect(current_path).to eq(signin_path)
            within('//form') do
              fill_in("session_email", with: user.email)
              fill_in("session_password", with: "password")
              click_button("Sign In")
            end
          expect(current_path).to eq user_path(user)
          expect(page).to have_content('Sucsessfully Logged In!')
        end
      end
        it 'can register a applicant' do
          visit home_path
          click_link('Register')
          click_button('Applicant Registration')
          expect(current_path).to eq(new_user_path)
          fill_in("email", with: "user@example.com")
          fill_in("First Name", with: "Bob")
          fill_in("Last Name", with: "Gu")
          fill_in("Password", with: "password")
          fill_in("Confirmation", with: "password")
          click_button("Register")
          expect(current_path).to eq user_path(User.last)
        end

        it 'gets an error when entering invalid info as an applicant' do
          visit home_path
          click_link('Register')
          click_button('Applicant Registration')
          expect(current_path).to eq(new_user_path)
          fill_in("email", with: "u")
          fill_in("First Name", with: "Bob")
          fill_in("Last Name", with: "Gu")
          fill_in("Password", with: "password")
          fill_in("Confirmation", with: "password")
          click_button("Register")
          expect(page).to have_content('Email is invalid')
        end

      it 'can log in as applicant' do
        user = User.new
          user.first_name            = "John"
          user.last_name             = "Connor"
          user.email                 = "getToTheChoppa@example.com"
          user.password              = "password"
          user.password_confirmation = "password"
        user.save

        visit signin_path
        expect(current_path).to eq(signin_path)
          within('//form') do
            fill_in("session_email", with: user.email)
            fill_in("session_password", with: "password")
            click_button("Sign In")
          end
        expect(current_path).to eq user_path(user)
      end

    context 'the applicant user' do

      before(:each) do
        listing1 = Listing.create(title: 'Joby job job',
                                  description: 'We will work your ass off',
                                  pay_rate: 100,
                                  employment_type: 'hourly',
                                  number_of_positions: 3,
                                  closing_date: Time.now + 1000
                                 )

        category1 = Category.create(title: "Great Jobs", description: "Jobs that don't suck")

        @listing  = Listing.last

        category1.listings << listing1

        visit home_path
      end

      it 'has a link to browse current job listings' do
        expect(page).to have_link('Browse current job listings')
      end

      it 'can browse current job listings as an unauthenticated applicant user' do
        click_link('Browse current job listings')
        expect(current_path).to eq(listings_path)


        expect(page).to have_content(@listing.title)
        expect(page).to have_content(@listing.description)
      end

      it 'can view the details of a job listing as an unauthenticated applicant user' do
        visit listings_path
        expect(current_path).to eq(listings_path)

        click_link('Joby job job')
        expect(current_path).to eq(listing_path(@listing))
        expect(page).to have_content(@listing.title)
        expect(page).to have_content(@listing.description)
        expect(page).to have_content(@listing.pay_rate)
        expect(page).to have_content(@listing.employment_type)
        expect(page).to have_content(@listing.number_of_positions)
      end

      it 'has links to apply for a job' do
        visit listing_path(@listing)
        expect(page).to have_button('Apply for this job!')
        expect(page).to have_link('Back to browsing')
      end

      # it 'has a link to register a new applicant' do
      #   expect(page).to have_link('Register as an Applicant')
      # end
    end
  end
end
