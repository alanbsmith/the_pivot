require 'feature_helper'

describe "User Authentication", type: :feature do

  before(:each) do
    visit signin_path
  end

  it "should have a link to signin on the home page" do
    visit home_path
    expect(current_path).to eq(home_path)
    expect(page).to have_link("Log In")
  end

  it "can visit the signin page" do
    expect(current_path).to eq(signin_path)
    expect(page).to have_field("session_email")
    expect(page).to have_field("session_password")
  end

  it "cannot signin with invalid information" do
    click_button("Log In")
    expect(current_path).to eq(sessions_path)
  end

  it "can sigin with valid information" do
    @user = User.create(email: "duck@example.com",
                        company_name: "Turing",
                        password: "userpassword",
                        password_confirmation: "userpassword",
                        first_name: "Duck",
                        last_name: "Dogers")


      fill_in "session_email",    with: @user.email
      fill_in "session_password", with: @user.password

      click_button "Log In"

    expect(page).to have_link("Add a New Job Listing",  href: new_listing_path)
    expect(page).to have_link("View Current Job Listings",  href: listings_path)
    expect(page).to have_link("Log Out",    href: signout_path) 
    expect(page).to_not have_link("Log In", href: signin_path)

    click_link("Log Out")
      expect(current_path).to eq("/")
      expect(page).to_not have_link('Sign Out', href: signout_path)
      expect(page).to have_link("Log In",    href: signin_path)
  end
end
