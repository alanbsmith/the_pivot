require 'rails_helper'

RSpec.describe "Site", :type => :request do
  describe "GET /" do
    it "displays a splat page" do
      get root_path
      expect(response.status).to be(200)
    end
  end
end
