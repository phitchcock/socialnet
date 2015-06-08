# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: 'user', email: 'user@user.com', password: 'password', password_confirmation: 'password')
User.create(username: 'user1', email: 'user1@user.com', password: 'password', password_confirmation: 'password')
User.create(username: 'user2', email: 'user2@user.com', password: 'password', password_confirmation: 'password')
User.create(username: 'user3', email: 'user3@user.com', password: 'password', password_confirmation: 'password')
User.create(username: 'user4', email: 'user4@user.com', password: 'password', password_confirmation: 'password')