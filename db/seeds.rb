# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting the DB!"

Bet.destroy_all
Profile.destroy_all
GroupUser.destroy_all
Group.destroy_all
User.destroy_all
Draw.destroy_all

puts "Creating 10 users"


  30.times do
    user = User.create!(
      email: Faker::Internet.unique.email,
      password: 123456,
    )

  puts "Creating 1 profile for each user"
      Profile.create!(
        first_name: Faker::Games::SuperSmashBros.fighter,
        last_name: Faker::Games::SuperSmashBros.fighter,
        username: Faker::Creature::Animal.unique.name,
        user: user,
        date_of_birth: 19910725,
        nif: 123456789,
        bio: 'test'
      )
  end

puts "Creating 10 draws"

  10.times do
    Draw.create!(
      numbers: [1, 2, 3, 4, 5],
      stars: [5, 6],
      draw_date: Date.today,
      closing_date: Date.today
    )
  end

puts "Creating 30 groups"

  30.times do
    Group.create!(
      name: Faker::Music.unique.band,
      description: 'this is a test',
      user: User.all.sample,
    )
  end

puts 'Adding members to groups'
  70.times do
    GroupUser.create(
      user: User.all.sample,
      group: Group.all.sample
    )
  end

puts "Placing 30 bets"

  30.times do
    Bet.create!(
     numbers: [6, 2, 3, 4, 5],
     stars: [8, 9],
     status: ['millionaire'],
     user: User.all.sample,
     group: Group.all.sample,
     draw: Draw.all.sample
    )
  end

