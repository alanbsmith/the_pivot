FactoryGirl.define do
  factory :user do
    first_name  "Mr."
    last_name  "Monkey"
    email   "monkey@example.com"
    password "olivejuice"
    password_confirmation "olivejuice"
  end
end 