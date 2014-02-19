# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Person.create(name: 'Anna')
Person.create(name: 'Brendan')
Person.create(name: 'Calum')
Person.create(name: 'Erin')
Person.create(name: 'Jamie')
Person.create(name: 'Jenifer')
Person.create(name: 'Joseph')
Person.create(name: 'Mathew')
Person.create(name: 'Tom')

Theme.create(title: 'Dummy Theme', issue_number: '01', published: true)

Link.create(
  title: 'Fake Link 01', 
  url: 'http://www.withassociates.com', 
  description: 'Dummy link for your development environment.',
  theme_id: 1,
  person_id: 1
)

Link.create(
  title: 'Fake Link 02',
  url: 'http://www.withassociates.com',
  description: 'Dummy link for your development environment.',
  theme_id: 1,
  person_id: 2
)
