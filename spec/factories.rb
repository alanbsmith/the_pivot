FactoryGirl.define do
  factory :user do
    first_name  "Mr."
    last_name  "Monkey"
    email   "monkey@example.com"
    password "olivejuice"
    password_confirmation "olivejuice"
    role "default"
  end


  factory :admin do
    first_name  "Mr."
    last_name  "Monkey"
    email   "admin@example.com"
    password "password"
    password_confirmation "olivejuice"
    role "admin"
  end
end
