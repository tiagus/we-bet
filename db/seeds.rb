# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting the DB!"

Bet.destroy_all
Draw.destroy_all
Group.destroy_all
Profile.destroy_all

puts "Creating 10 users"

  10.times do
    User.create!(
      email: Faker::Internet.unique.email,
      password: 123456,
    )
  end

puts "Creating 10 profiles"

  10.times do
    Profile.create!(
      first_name: Faker::Games::SuperSmashBros.fighter,
      last_name: Faker::Games::SuperSmashBros.fighter,
      username: Faker::TvShows::BreakingBad.unique.character,
      user_id: 1,
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


puts "Creating 10 groups"

  10.times do
    Group.create!(
      name: Faker::TvShows::BreakingBad.unique.character,
      description: 'this is a test',
      user_id: 1,
    )
  end

puts "Placing 20 bets"

  20.times do
    Bet.create!(
     numbers: [6, 2, 3, 4, 5],
     stars: [8, 9],
     status: ['millionaire'],
     user_id: 1,
     group_id: 1,
     draw_id: 5
    )
  end
