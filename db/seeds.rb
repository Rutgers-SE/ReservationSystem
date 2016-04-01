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
  password: "1234qwer",
  password_confirmation: "1234qwer"
)

user.skip_confirmation!
user.save!

owner = Owner.new(
  first_name: "test",
  last_name: "Admin 1",
  email: "test@admin.com",
  password: "1234qwer",
  password_confirmation: "1234qwer"
)

owner.skip_confirmation!
owner.save!

admin = Admin.new(
  first_name: "test",
  last_name: "Admin 1",
  email: "test@admin.com",
  password: "1234qwer",
  password_confirmation: "1234qwer"
)

admin.skip_confirmation!
admin.save!
