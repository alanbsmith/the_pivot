class Seed
  def initialize
    generate_users
  end

  def generate_users
    User.create!(
      first_name: "Robert",
      last_name: "Gu",
      email: "robertgu@example.com",
      password: "password",
      password_confirmation: "password"
      )
    20.times do |i|
      user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "password",
        password_confirmation: "password"
        )
      puts "User #{i}: #{user.first_name} - #{user.email} created!"
    end

    20.times do |i|
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

end

Seed.new
