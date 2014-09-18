# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tenant do
    user_id 1
    subdomain "MyString"
    name "MyString"
  end
end
