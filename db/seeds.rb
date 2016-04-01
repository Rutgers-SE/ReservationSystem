# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = Customer.new(
  first_name: "test",
  last_name: "user 1",
  email: "test@test.com",
  password: "1234qwer",
  password_confirmation: "1234qwer"
)

user.skip_confirmation!
user.save!
