require "feature_helper"

describe "the applicant user view", type: :feature do

  describe "the home view" do

    it "has a link to browse listings on the home page" do
      visit home_path
      expect(page).to have_link("Register Now")
    end
  end

  describe "the registration process" do

    it "can go to the registration page" do
      visit home_path
      click_link("Register Now")
      expect(current_path).to eq(new_user_path)
    end


  end


      before(:each) do
        listing1 = Listing.create(title: 'Joby job job',
                                  description: 'We will work your ass off',
                                  pay_rate: 100,
                                  employment_type: 'hourly',
                                  number_of_positions: 3,
                                  closing_date: Time.now + 1000
                                 )

        category1 = Category.create(title: "Great Jobs", description: "Jobs that don't suck")

        @listing  = Listing.first

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

end
