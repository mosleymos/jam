# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create!([{ name: 'Bobby', age: 55, sexe: 'Masculin', ville: 'Paris', email: 'bobby@example.com', password:'password'},
{ name: 'Scarlett', age: 29, sexe: 'Feminin', ville: 'Paris', email: 'scarlett@example.com', password:'password'}, 
{ name: 'Cruella', age: 32, sexe: 'Feminin', ville: 'Paris', email: 'cruella@example.com', password:'password'},
{ name: 'Bogosse77', age: 39, sexe: 'Masculin', ville: 'Paris', email: 'bogosse77@example.com', password:'password'} ])