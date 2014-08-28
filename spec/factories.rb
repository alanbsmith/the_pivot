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

  factory :item do

    title       "Chocolate Dream"
    description "Caramel ribbons in out rich chocolate base, with a hint of Bailey's"
    price        6.50
    status       1
  end

  factory :category do
    items {[FactoryGirl.create(:item)]}
    title       "Chocolate"
    description "Our Chocolate base is made from only the freshest and purest cocoa beans"
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
