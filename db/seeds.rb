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

# Festival.destroy_all

# Festival.create(name: 'Ramen Festival', event_date: '7/21/2014', price: '$1', start_time: '11:00', end_time: '14:00', details: 'Bring your appetite!', street: '285 W Huntington Drive', city: 'Arcadia', state: 'CA', zip: '91007', neighborhood: sgv)
# Festival.create(name: 'Fireworks', price: 'free', event_date: '7/4/2014', start_time: '21:00', end_time: '24:00', details: 'Come celebrate Independence Day with us!', street: '100 W. Torrance Blvd.', city: 'Redondo Beach', state: 'CA', zip: '90277', neighborhood: sb)

# ArtEvent.destroy_all

# ArtEvent.create(name: 'Art Walk', price: '$5', event_date: '8/2/2014', start_time: '14:00', end_time: '16:00', details:'We have snacks', street: '2015 Havemeyer Ln. Unit B', city: 'Redondo Beach', state: 'CA', zip: '90278', neighborhood: sb)