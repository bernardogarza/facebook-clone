# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

25.times do
    user = User.create!(first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        email: Faker::Internet.email,
                        password: '123456',
                        password_confirmation: '123456')
    rand(5..10).times do
        user.posts.create!( body: Faker::Quote.famous_last_words )
    end
end

# Users
users = User.all

# Friend Request
def friend_request(user)
    random_user = User.find(rand((User.first.id)..(User.last.id)))
    if Friendship.find_by(user: user, friend: random_user, confirmed: true) || Friendship.find_by(user: random_user, friend: user, confirmed: true)
        friend_request(random_user)
    else
        user.friendships.create!( friend: random_user, confirmed: true )
    end
end

# Create comments
users.each do |user|
    rand(5..7).times do
        random_post = Post.find(rand((Post.first.id)..(Post.last.id)))
        user.comments.create!( body: Faker::Quote.most_interesting_man_in_the_world,
                               post: random_post )
        user.likes.create!( post: random_post )
    end

# Create friendships
    rand(3..5).times do
        friend_request(user)
    end
end