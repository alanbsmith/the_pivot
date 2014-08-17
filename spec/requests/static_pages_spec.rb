require 'feature_helper'

RSpec.describe "StaticPagesSpecs", :type => :request do
  describe "Static Pages" do

    describe "Home page" do

      it "should have content Scream 'n Cream" do
        visit root_path
        expect(page).to have_content("Scream n' Cream")
      end

      it "should have the right title 'Home'" do
        pending
        visit root_path
        expect(page).to have_title("Scream n' Cream | Home")
      end

      it "should not have a custom page title" do
        visit root_path
        expect(page).not_to have_title("| Home")
      end

    end

    describe "About page" do

      it "should have content About Us" do
        visit about_path
        expect(page).to have_content("About Us")
      end

      it "should have the right title 'About Us'" do
        pending
        visit about_path
        expect(page).to have_title("Scream n' Cream | About Us")
      end

    end

    describe "Contact page" do

      it "should have content contact us" do
        visit contact_path
        expect(page).to have_content("Contact Us")
      end

      it "should have the right title 'Contact'Us" do
        pending
        visit contact_path
        expect(page).to have_title("Scream n' Cream | Contact Us")
      end

    end

  end
end
