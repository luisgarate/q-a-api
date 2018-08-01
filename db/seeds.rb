# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding process STARTED"

100.times do
  User.create(
    full_name: Faker::Name.name_with_middle
  )
end

puts "****************************************"
puts "Users created"

users_ids = User.ids

500.times do
  Question.create(
    content: Faker::Lorem.question,
    private: Faker::Boolean.boolean,
    user_id: users_ids.sample
  )
end

puts "****************************************"
puts "Questions created"

questions_ids = Question.ids

1500.times do
  Answer.create(
    content: Faker::Lorem.sentence,
    user_id: users_ids.sample,
    question_id: questions_ids.sample
  )
end

puts "****************************************"
puts "Answers created"

49.times do
  Tenant.create(
    full_name: Faker::Name.name_with_middle,
    requests_amount: 0
  )
end

Tenant.create(full_name: "Altoros", requests_amount: 0)

puts "****************************************"
puts "Tenants created"

puts "****************************************"
puts "Seeding process FINISHED"
