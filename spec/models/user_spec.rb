require 'rails_helper'

RSpec.describe User, :type => :model do
  before { @user = User.new(first_name: "firstname", last_name: "lastname", email: "user@example.com") }

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }

  it "should not be valid without a first name" do
    @user.first_name = nil
    expect(@user).to_not be_valid
  end

  it "should not be valid without a last name" do
    @user.last_name = nil
    expect(@user).to_not be_valid
  end

  it "should not be valid without an email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it "should not be valid when first name exceeds 30 characters" do
    @user.first_name = ("a" * 31)
    expect(@user).to_not be_valid
  end

  it "should not be valid when last name exceeds 30 characters" do
    @user.last_name = ("a" * 31)
    expect(@user).to_not be_valid
  end

  describe 'when email formats are invalid' do
    it 'should be invalid' do
      addresses = %w[wee,hi@example.com
                     hi_thereatexample.org
                     jacked@example+wutwut.com]

      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to_not be_valid
      end
    end
  end

  describe 'when email formats are valid' do
    it 'should be valid' do
      addresses = %w[wee.hi@example.com
                     hithere@example.com
                     jackeDd@example.wutwut.COM]

      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end



end
