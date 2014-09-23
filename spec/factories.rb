FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    email "johndoe@example.com"
    company_name "Turing"
    password "password"
    password_confirmation "password"
  end

  factory :tenant do
    user_id 1
    subdomain "MyString"
    name "MyString"
  end

  factory :listing do
    title               "Worker"
    description         "Do work son"
    employment_type     "part time"
    pay_rate            "1.00/hr"
    number_of_positions 1
    closing_date        Time.now + 1000
  end

  factory :category do
    listings {[FactoryGirl.create(:listing)]}
    title       "Things"
    description "Lots of things to do"
  end

  factory :cart do
  end

  factory :cart_item do
    cart {FactoryGirl.create(:cart)}
    item {FactoryGirl.create(:item)}

    quantity 3
  end

  # factory :order do
  #   user_id {FactoryGirl.create(:user)}
  #
  #   status     "open"
  #   total      19.50
  #   receiving  "pickup"
  # end
end