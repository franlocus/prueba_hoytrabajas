# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

20.times do |i|
  Bank.create(name: "Bank N #{i}")
end

Bank.find_each do |bank|
  Provider.create(
    name: "Provider N #{bank.id}",
    nit: '123456789-1',
    contact_person_name: 'John Doe',
    contact_person_number: '123456789',
    bank_name: bank.name,
    bank_account_number: '123456789012345'
  )
end