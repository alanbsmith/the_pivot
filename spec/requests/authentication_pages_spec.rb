require 'feature_helper'

describe "StaticPagesSpecs", type: :request do

	context"signin page"
	before(each:)do
		visit signin_path
	end

  it "has a signin page" do
    expect(page).to have_content.('Sign in')
    expect(page).to have_title.('Sign in')
	end

	it "should have a selector" do
		expect(page).to have_selector('div.alert.alert-error')
	end

end
