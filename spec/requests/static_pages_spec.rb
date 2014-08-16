require 'feature_helper'

RSpec.describe "StaticPagesSpecs", :type => :request do
  describe "Static Pages" do

    describe "Home page" do

      it "should have content Scream 'n Cream" do
        visit '/home'
        expect(page).to have_content("Scream n' Cream")
      end

      it "should have the right title 'Home'" do
        pending
        visit '/home'
        expect(page).to have_title("Scream n' Cream | Home")
      end

      it "should not have a custom page title" do
        visit '/home'
        expect(page).not_to have_title("| Home")
      end

    end

    describe "About page" do

      it "should have content About Us" do
        visit '/about'
        expect(page).to have_content("About Us")
      end

      it "should have the right title 'About Us'" do
        pending
        visit '/about'
        expect(page).to have_title("Scream n' Cream | About Us")
      end

    end

    describe "Contact page" do

      it "should have content contact us" do
        visit '/contact'
        expect(page).to have_content("Contact Us")
      end

      it "should have the right title 'Contact'Us" do
        pending
        visit '/contact'
        expect(page).to have_title("Scream n' Cream | Contact Us")
      end

    end

  end
end
