require "open-uri"

puts "Deleting the DB!"

Message.destroy_all
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

  puts "Creating a user profile..."
      profile = Profile.create!(
        first_name: Faker::Name.name,
        last_name: Faker::Name.last_name ,
        username: Faker::Internet.unique.username,
        user: user,
        date_of_birth: 19910725,
        nif: 123456789,
        bio: Faker::Quote.famous_last_words
      )
      random = rand(5..12)
      p url = "https://api.adorable.io/avatars/#{random}"
      picture = URI.open(url)
      profile.photo.attach(io: picture, filename: "profileavatar#{random}.jpg", content_type: 'image/jpg')
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
    random = rand(1..400)
    url = "https://api.adorable.io/avatars/#{random}"
    p url
    file = URI.open(url)
    group = Group.create!(
      name: Faker::Team.unique.name,
      description: Faker::Quote.singular_siegler,
      user: User.all.sample,
    )
    group.photo.attach(io: file, filename: "groupavatar#{random}.png", content_type: 'image/png')
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
     status: ['Ongoing'],
     user: User.all.sample,
     group: Group.all.sample,
     draw: Draw.all.sample
    )
  end

    ## User for Demos ##
  puts "Creating demo user..."

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
      bio: 'From Algarve, Portugal. No play, no gain.',
    )
    picture = URI.open('https://www.atelevisao.com/wp-content/uploads/2013/04/zeze-camarinha-5-3-2251.jpg')
    demo_profile.photo.attach(io: picture, filename: 'group.jpg', content_type: 'image/jpg')


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

puts 'Finished!'
