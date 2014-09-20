FactoryGirl.define do
  factory :user do
    first_name "Horacio"
    last_name "Chavez"
    sequence(:email) { |n| "test#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end
end
