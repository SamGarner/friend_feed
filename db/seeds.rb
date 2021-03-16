# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.create([{ id: 1, name: 'Iris', email: 'iris@noodle.com', username: 'iris',
               password: 'Password2', password_confirmation: 'Password2' },
             { id: 2, name: 'Chewbert', email: 'chewy@noodle.com', username: 'chewy',
               password: 'Password3', password_confirmation: 'Password3' },
             { id: 3, name: 'Ben', email: 'ben@path.com', username: 'bensteve',
               password: 'Password3', password_confirmation: 'Password3' },
             { id: 4, name: 'Roo', email: 'roo@noodle.com', username: 'roo',
               password: 'Password3', password_confirmation: 'Password3' },
             { id: 5, name: 'Pia', email: 'pia@noodle.com', username: 'pia',
               password: 'Password3', password_confirmation: 'Password3' },
             { id: 6, name: 'Zlatan', email: 'z@acm.com', username: 'Zlatan',
               password: 'Password3', password_confirmation: 'Password3' },
               { id: 7, name: 'Gigio', email: 'gigio@acm.com', username: 'GD99',
               password: 'Password3', password_confirmation: 'Password3' }])
Post.destroy_all
Post.create([{ id: 1, content: 'Just bought Ticket to Ride. Anyone for game night?', user_id: 5 },
             { id: 2, content: 'IZ back!', user_id: 6 },
             { id: 3, content: 'WFH = unlimited coffee!', user_id: 1 },
             { id: 4, content: 'Another hat-trick, another win!', user_id: 6 }])
Comment.destroy_all
Comment.create([{ id: 1, user_id: 5, commentable_type: 'Post', commentable_id: 3,
                  content: 'Those Ethiopian beans you had last week were unbeatable!'},
                { id: 2, user_id: 1, commentable_type: 'Post', commentable_id: 4,
                  content: 'Fantastic match, Z!' },
                { id: 3, user_id: 1, commentable_type: 'Post', commentable_id: 2,
                  content: "Sweden isn't ready!" },
                { id: 4, user_id: 6, commentable_type: 'Post', commentable_id: 4,
                  content: "grazie mille"}])
Friendship.destroy_all #also covers requests 
Friendship.create([{ sender_id: 1, receiver_id: 5, is_request: false },
                   { sender_id: 6, receiver_id: 1, is_request: false },
                   { sender_id: 1, receiver_id: 2, is_request: true },
                   { sender_id: 3, receiver_id: 1, is_request: true }])
                   # { sender_id: 4, receiver_id: 1, is_request: true }])
Like.destroy_all
Like.create([{ user_id: 1, likable_type: 'Post', likable_id: 1 },
             { user_id: 4, likable_type: 'Post', likable_id: 1 },
             { user_id: 1, likable_type: 'Comment', likable_id: 1 },
             { user_id: 6, likable_type: 'Comment', likable_id: 2 },
             { user_id: 5, likable_type: 'Post', likable_id: 2 }])
