class Seed
  def initialize
    generate_users
    generate_categories
    generate_listings
  end

  def generate_users
    User.create!(
      first_name: "Robert",
      last_name: "Gu",
      email: "robertgu@example.com",
      password: "password",
      password_confirmation: "password"
      )
    10.times do |i|
      user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "password",
        password_confirmation: "password"
        )
      puts "User #{i}: #{user.first_name} - #{user.email} created!"
    end

    10.times do |i|
      user = User.create!(
        company_name: Faker::Company.name,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "password",
        password_confirmation: "password"
        )
      puts "User #{i}: #{user.first_name} - #{user.company_name} created!"
    end

  end

  def generate_categories
    categories = %w(Technology Marketing Communications Education Food Services
    Medical Business Science)
    8.times do |i|
      category = Category.create!(
        title: categories[i],
        description: Faker::Company.catch_phrase
      )
      puts "Category #{i}: #{category.title} - #{category.description} created!"
    end
  end

  def generate_listings
    50.times do |i|
      listing = Listing.create!(
        title: Faker::Name.title,
        description: Faker::Lorem.paragraph(3),
        pay_rate: random_pay_rate,
        employment_type: random_employment_type,
        business_id: random_business_id,
        closing_date: random_closing_date,
        category_ids: random_category_id
      )
      puts "Listing #{i}: #{listing.title} - #{listing.closing_date}"
    end
  end

  def random_pay_rate
    random_rate = ["hr", "yr"]
    if random_rate.sample == "yr"
      (30000..450000).to_a.sample.to_s + "yr"
    else
      (9..45).to_a.sample.to_s + "hr"
    end
  end

  def random_employment_type
    ["full-time", "part-time"].sample
  end

  def random_closing_date
    Time.now + (25000..1000000).to_a.sample
  end

  def random_business_id
    (1..10).to_a.sample
  end

  def random_category_id
    Category.all.sample.id
  end




end

Seed.new
