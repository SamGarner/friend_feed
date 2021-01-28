# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.create([{ name: 'Iris Noodle', email: 'iris@noodle.com', username: 'noodle',
               password: 'Password2', password_confirmation: 'Password2' },
             { name: 'Chewbert', email: 'chewy@noodle.com', username: 'chewy',
               password: 'Password2', password_confirmation: 'Password2' },
             { name: 'Ben Steve', email: 'ben@path.com', username: 'steven',
               password: 'Password2', password_confirmation: 'Password2' },
             { name: 'Roo', email: 'roo@noodle.com', username: 'roo',
               password: 'Password2', password_confirmation: 'Password2' }])
