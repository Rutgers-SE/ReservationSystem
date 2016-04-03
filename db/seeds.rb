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
  email: "test@customer.com",
  password: "12345678",
  password_confirmation: "12345678"
)

user.skip_confirmation!
user.save!

owner = Owner.new(
  first_name: "test",
  last_name: "Admin 1",
  email: "test@owner.com",
  password: "12345678",
  password_confirmation: "12345678"
)

owner.skip_confirmation!
owner.save!

admin = Admin.new(
  first_name: "test",
  last_name: "Admin 1",
  email: "test@admin.com",
  password: "12345678",
  password_confirmation: "12345678"
)

admin.skip_confirmation!
admin.save!

price = Price.create(
  pennies: 200
)

