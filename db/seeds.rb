require 'faker'

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
        description: description + description,
        pay_rate: random_pay_rate,
        employment_type: random_employment_type,
        creator_id: random_creator_id,
        closing_date: random_closing_date,
        category_ids: random_category_id,
        number_of_positions: random_number_of_positions,
        location_city:  Faker::Address.city,
        location_state: Faker::Address.state_abbr
      )
      puts "Listing #{i}: #{listing.title} - #{listing.closing_date}"
    end
  end

  def random_number_of_positions
    (1..20).to_a.sample
  end

  def random_pay_rate
    random_rate = [" / hr", " / yr"]
    if random_rate.sample == "yr"
      (30000..450000).to_a.sample.to_s + " / yr"
    else
      (9..45).to_a.sample.to_s + " / hr"
    end
  end

  def random_employment_type
    ["full-time", "part-time"].sample
  end

  def random_closing_date
    Time.now + (25000..1000000).to_a.sample
  end

  def random_creator_id
    (12..20).to_a.sample
  end

  def random_category_id
    Category.all.sample.id
  end

  def random_location

  end

  def description
    "About the Job
    This job is one of the most important members of the team, essentially building
    and maintaining the foundation on which the company sits. This is the perfect opportunity for outgoing,
    tech-savvy individuals looking to have a big impact on a growing business.

    At this job, you will work closely with graphic designers and marketing professionals to build and maintain websites.
    You will be the glue that bridges the gap between creative design and technical development.


    RESPONSIBILITIES
    Designs, codes, and tests technical solutions
    Web design including page layouts and web-based graphics
    Identifies system deficiencies and recommends solutions
    Assists in physical and logical database design
    Understands the necessity of and contributes to coding standards
    Assists in enforcement of development deadlines and schedules
    Provides support to customer inquiries and requests

    REQUIREMENTS
    Bachelors or Associates Degree in Web Development or related field. Equivalent combination of education and/or experience may be substituted for degree
    Portfolio/Examples of previous work
    Can write effective stored procedures
    Understanding of and ability to do cross-browser development
    Familiarity with any or all of the following: HTML, CSS, PHP, MySQL, Javascript, and Flash
    Understanding of the web design process and how it ties to the functionality of a website
    Prioritizes multiple tasks effectively
    Excellent critical thinking and problem solving abilities
    Strong written and verbal communication skills
    Positive attitude and driven personality"
  end
end

Seed.new
