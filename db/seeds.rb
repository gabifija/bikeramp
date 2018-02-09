# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trip.create!(
  start_address: 'Plac Europejski 2, Warszawa, Polska',
  destination_address: 'Plac Europejski 2, Warszawa, Polska',
  price: '65',
  date: '2001-02-03T04:05:06+00:00'
)

Trip.create!(
  start_address: 'Plac Europejski 2, Warszawa, Polska',
  destination_address: 'Rynek Główny 39, Kraków, Polska',
  price: '85',
  date: '2017-02-03T04:05:06+00:00'
)
