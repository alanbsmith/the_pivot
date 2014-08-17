require 'rails_helper'

RSpec.describe "UserPages", :type => :request do
  describe "User page" do
    it "has a register page" do
      get register_path
      expect(response.status).to be(200)
    end
  end
end
