# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Neighborhood.destroy_all

dt = Neighborhood.create(name: 'Downtown')
el = Neighborhood.create(name: 'East LA')
hb = Neighborhood.create(name: 'Hollywood/Beverly Hills')
ws = Neighborhood.create(name: 'Westside')
sb = Neighborhood.create(name: 'South Bay')
lb =Neighborhood.create(name: 'Long Beach')
oc = Neighborhood.create(name: 'Orange County')
sfv = Neighborhood.create(name: 'San Fernando Valley')
sgv = Neighborhood.create(name: 'San Gabriel Valley')
etc = Neighborhood.create(name: 'Etc.')

EventType.destroy_all

EventType.create(name: 'Festival')
EventType.create(name: 'Art')
EventType.create(name: 'Concert')
EventType.create(name: 'Geek')
EventType.create(name: 'Etc.')