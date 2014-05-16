# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Festival.destroy_all

Festival.create(name: 'Ramen Festival', type: 'Food', fest_date: '7/21/2014', start_time: '11:00', end_time: '14:00', details: 'Bring your appetite!', street: '285 W Huntington Drive', city: 'Arcadia', state: 'CA', zip: '91007')
Festival.create(name: 'Fireworks', type: 'Holiday', fest_date: '7/4/2014', start_time: '21:00', end_time: '24:00', details: 'Come celebrate Independence Day with us!', street: '100 W. Torrance Blvd.', city: 'Redondo Beach', state: 'CA', zip: '90277')

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
