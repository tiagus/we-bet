puts "Deleting the DB!"

Message.destroy_all
Conversation.destroy_all
Bet.destroy_all
Profile.destroy_all
GroupUser.destroy_all
Group.destroy_all
User.destroy_all
Draw.destroy_all

random_picture = URI.open('https://source.unsplash.com/random/400x200')

puts "Creating 10 users"


  30.times do
    user = User.create!(
      email: Faker::Internet.unique.email,
      password: 123456,
    )

  puts "Creating 1 profile for each user"
      profile = Profile.create!(
        first_name: Faker::Name.unique.name,
        last_name: Faker::Name.unique.name,
        username: Faker::Creature::Animal.unique.name,
        user: user,
        date_of_birth: 19910725,
        nif: 123456789,
        bio: 'test'
      )
      profile.photo.attach(io: random_picture, filename: 'nes.jpg', content_type: 'image/jpg')
  end

puts "Creating 10 draws"

  10.times do
    Draw.create!(
      numbers: [rand(1..10), rand(11..20), rand(21..30), rand(31..40), rand(41..50)],
      stars: [rand(1..4), rand(5..12)],
      draw_date: Date.today,
      closing_date: Date.today
    )
  end

puts "Creating 30 groups"

  30.times do
    group = Group.create!(
      name: Faker::Music.unique.band,
      description: 'this is a test',
      user: User.all.sample,
    )
    group.photo.attach(io: random_picture, filename: 'profile.jpg', content_type: 'image/jpg')
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
    numbers: [rand(1..10), rand(11..20), rand(21..30), rand(31..40), rand(41..50)],
    stars: [rand(1..4), rand(5..12)],
     status: ['millionaire'],
     user: User.all.sample,
     group: Group.all.sample,
     draw: Draw.all.sample
    )
  end

## User for Demos ##
  puts "Creating demo user"

    demo = User.create!(
      email: 'demo@demo.com',
      password: 123456,
    )


    demo_profile = Profile.create!(
      first_name: 'José',
      last_name: 'Camarinha',
      username: 'Zézé_420',
      user: demo,
      date_of_birth: 19610925,
      nif: 223451789,
      bio: 'Portuguese stallion from Algarve. No play, no gain.',
    )
    demo_profile.photo.attach(io: random_picture, filename: 'group.jpg', content_type: 'image/jpg')


    10.times do
    GroupUser.create(
      user: demo,
      group: Group.all.sample
      )
  end

    10.times do
    Bet.create!(
     numbers: [6, 2, 3, 4, 5],
     stars: [8, 9],
     status: ['millionaire'],
     user: demo,
     group: demo.groups.sample,
     draw: Draw.all.sample
    )
  end
