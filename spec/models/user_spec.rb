require 'rails_helper'

RSpec.describe User, :type => :model do
  before { @user = User.new(username: "Example User", email: "user@example.com") }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  
end
