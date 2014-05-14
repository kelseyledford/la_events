# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Festival.destroy_all

Festival.create(fest_date: '7/21/2014', name: 'Ramen Festival', type: 'Food',  start_time: '11am', end_time: '2pm')
Festival.create(fest_date: '7/4/2014', name: 'Fireworks', type: 'Holiday', start_time: '9pm')

Neighborhood.destroy_all

Neighborhood.create(name: 'Westside')
Neighborhood.create(name: 'South Bay')
Neighborhood.create(name: 'Long Beach')
Neighborhood.create(name: 'Downtown')
Neighborhood.create(name: 'Orange County')
Neighborhood.create(name: 'The Valley')
Neighborhood.create(name: 'East LA')
Neighborhood.create(name: 'Mid-City')
Neighborhood.create(name: 'Etc.')
