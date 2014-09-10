# require 'feature_helper'

# describe "Authentication" do

#   subject { page }

#   describe "signin page" do
#     before(:each) do
#       visit signin_path
#     end

#     it { should have_content('Signin') }
#     it { should have_title('Signin') }
#   end

# 	describe "signin" do
# 	  before { visit signin_path }

#     describe "with invalid information" do
#       before { click_button "Signin" }

#       it { should have_title('Signin') }
#     end

#     describe "after visiting another page" do
#       before { click_link "Home" }
#     end

#     describe "with valid information" do
#       let(:user) { FactoryGirl.create(:user) }
#     	before do
#       	fill_in "Email",    with: user.email.upcase
#       	fill_in "Password", with: user.password
#       	click_button "Signin"
#   		end

#       it { should have_link('Profile',    href: user_path(user)) }
#       it { should have_link('Signout',    href: signout_path) }
#       it { should_not have_link('Signin', href: signin_path) }

#       describe "followed by signout" do
#         before { click_link "Signout" }
#         it {should_not have_link('Signin', href: signin_path)}
#       end
#     end
#   end
# end
