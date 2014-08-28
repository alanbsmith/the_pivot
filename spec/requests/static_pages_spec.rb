require 'feature_helper'

RSpec.describe "StaticPagesSpecs", :type => :request do
  describe "Static Pages" do

    describe "Home page" do

      it "should have content Scream 'n Cream" do
        visit root_path
        expect(page).to have_content("Scream n' Cream")
      end

      it "should have the right title 'Home'" do
        visit root_path
        expect(page).to have_title("Scream n' Cream")
      end

      it "should not have a custom page title" do
        visit root_path
        expect(page).not_to have_title("| Home")
      end

    end

    describe "Contact page" do

      it "should have content contact us" do
        visit contact_path
        expect(page).to have_content("Contact Us")
      end

      it "should have the right title 'Contact Us" do
        visit contact_path
        expect(page).to have_title("Contact Us")
      end

    end

  end
end
