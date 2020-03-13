require "open-uri"

puts "Deleting the DB!"

Message.destroy_all
Order.destroy_all
Bet.destroy_all
Profile.destroy_all
GroupUser.destroy_all
Group.destroy_all
User.destroy_all
Draw.destroy_all

puts "Creating 10 users"


  50.times do
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
      random = rand(1..38)
      p url = "https://api.adorable.io/avatars/#{random}"
      picture = URI.open(url)
      profile.photo.attach(io: picture, filename: "profileavatar#{random}.jpg", content_type: 'image/jpg')
  end

puts "Creating 10 draws"

  10.times do
    Draw.create!(
      numbers: [rand(1..10), rand(11..20), rand(21..30), rand(31..40), rand(41..50)],
      stars: [rand(1..4), rand(5..12)],
      draw_date: Date.today + rand(0..100),
      closing_date: Date.today + rand(0..100)
    )
  end

################### Groups #############################

puts "Creating groups"


  10.times do
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

     benfica = Group.create!(
      name: 'Os Lampiões',
      description: 'Se és fã do Glorioso, aposta connosco',
      user: User.all.sample,
    )
    url1 = "https://i.pinimg.com/originals/fd/d1/c1/fdd1c1038aaa98ad28b5b0e9c138eda1.png"
    p url1
    file = URI.open(url1)
    benfica.photo.attach(io: file, filename: "1.png", content_type: 'image/png')



     porto = Group.create!(
      name: 'Dragões',
      description: 'Para fãs do FC Porto',
      user: User.all.sample,
    )
    url2 = "https://files.app.fcporto.pt/thumbs/500_3XPUFVX8GRO1wbyHC8rf5xrHPLuKKVMh2x.png"
    p url2
    file = URI.open(url2)
    porto.photo.attach(io: file, filename: "2.png", content_type: 'image/png')

      area = Group.create!(
      name: 'Area 51',
      description: 'Top Secret',
      public: false,
      user: User.all.sample,
    )
    url3 = "https://ichef.bbci.co.uk/news/660/cpsprodpb/AECD/production/_107894744_alien976.jpg"
    p url3
    file = URI.open(url3)
    area.photo.attach(io: file, filename: "3.png", content_type: 'image/png')


      vinho = Group.create!(
      name: 'Amigos da Farra',
      description: 'A minha parte eu quero em Vinho',
      user: User.all.sample,
    )
    url4 = "https://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/256/Apps-wine-icon.png"
    p url4
    file = URI.open(url4)
    vinho.photo.attach(io: file, filename: "4.png", content_type: 'image/png')


      carecas = Group.create!(
      name: 'Só carecas',
      description: 'Economizando champô',
      user: User.all.sample,
    )
    url5 = "https://pbs.twimg.com/profile_images/3725381968/96de3f192bfbd608eb2e493730d1d72a.jpeg"
    p url5
    file = URI.open(url5)
    carecas.photo.attach(io: file, filename: "5.png", content_type: 'image/png')

      bald = Group.create!(
      name: 'Bald Guys',
      description: 'Economizing shampoo',
      user: User.all.sample,
    )
    url6 = "https://thumbs.dreamstime.com/b/funny-bald-man-combing-his-head-senior-smiling-camera-138323525.jpg"
    p url6
    file = URI.open(url6)
    bald.photo.attach(io: file, filename: "6.jpg", content_type: 'image/jpg')

      lewagon = Group.create!(
      name: 'Le Wagon',
      description: 'Change your life, bet with us',
      user: User.all.sample,
    )
    url7 = "https://dwj199mwkel52.cloudfront.net/assets/lewagon-logo-square-fe76916e1b923ade71e253ae6dc031d936e5e8eebac4e26b0fbac650ea6ee360.png"
    p url7
    file = URI.open(url7)
    lewagon.photo.attach(io: file, filename: "7.jpg", content_type: 'image/jpg')

      trump = Group.create!(
      name: 'Donald Trump Fan Club',
      description: 'Make this group great again',
      user: User.all.sample,
    )
    url8 = "https://pmcdeadline2.files.wordpress.com/2019/10/shutterstock_editorial_10434333bm.jpg"
    p url8
    file = URI.open(url8)
    trump.photo.attach(io: file, filename: "8.jpg", content_type: 'image/jpg')

      continente = Group.create!(
      name: 'Continente Duque de Loulé',
      description: 'Employees of Continente',
      user: User.all.sample,
    )
    url9 = "https://lh3.googleusercontent.com/proxy/Kvptn_KuwSOoke9zeRbf1kHSJk5RbqzUUGy61MbaRDCZUhTUF-FUvmfRDz1Pjdaytnlf1MXEXE21zVl4GIZSRcXIrtUhmdNpvLM-UoRpJHb4KX4iqHCieWSRnTjHQkwnutpVeXEO2A"
    p url9
    file = URI.open(url9)
    continente.photo.attach(io: file, filename: "9.jpg", content_type: 'image/jpg')


      sporting = Group.create!(
      name: 'Lagartos',
      description: 'Sporting!!',
      user: User.all.sample,
    )
    url10 = "https://files.app.fcporto.pt/thumbs/514_T2H3gEzhXPKpYNrmpJd926yvl4E1ztXS2x.png"
    p url10
    file = URI.open(url10)
    sporting.photo.attach(io: file, filename: "10.png", content_type: 'image/png')

      boys = Group.create!(
      name: 'Bad Boys',
      description: 'For bad boys who want earn $$',
      user: User.all.sample,
    )
    url11 = "https://www.magazine-hd.com/apps/wp/wp-content/uploads/2019/09/will-smith-martin-lawrence-bad-boys-para-sempre-2.jpg"
    p url11
    file = URI.open(url11)
    boys.photo.attach(io: file, filename: "11.jpg", content_type: 'image/jpg')

      club = Group.create!(
      name: 'Samcro',
      description: 'For members of the Motorcycle Club',
      public: false,
      user: User.all.sample,
    )
    url12 = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQDBMmbQwMsK8ELDaNUcSZp3msfU4Yaxzqp1-mo7Hhf-chyefZr"
    p url12
    file = URI.open(url12)
    club.photo.attach(io: file, filename: "12.png", content_type: 'image/png')

      nerd = Group.create!(
      name: 'Nerd Herd',
      description: 'Bet with us',
      user: User.all.sample,
    )
    url13 = "https://cdn140.picsart.com/273219689007201.png?type=webp&to=crop&r=256"
    p url13
    file = URI.open(url13)
    nerd.photo.attach(io: file, filename: "13.png", content_type: 'image/png')

      elefante = Group.create!(
      name: 'Elefante Branco',
      description: 'Employees betting group',
      public: false,
      user: User.all.sample,
    )
    url14 = "https://www.elefantebranco.pt/wp-content/uploads/2019/01/Logo-ElefanteBranco-horizontal-letring-white.png"
    p url14
    file = URI.open(url14)
    elefante.photo.attach(io: file, filename: "14.png", content_type: 'image/png')

      friends = Group.create!(
      name: 'Friends 4 Ever',
      description: 'Come bet with us',
      user: User.all.sample,
    )
    url15 = "https://3.bp.blogspot.com/-1taIFjRjkCk/WIkUwanH9BI/AAAAAAAAeis/jIPaSCKXMIYXLYTqFgdIuF23MnQiNoNEQCLcB/s640/Timon%2Be%2BPumba.jpg"
    p url15
    file = URI.open(url15)
    friends.photo.attach(io: file, filename: "15.jpg", content_type: 'image/jpg')

      sintra = Group.create!(
      name: 'Sintra',
      description: 'biggest betting club of Sintra',
      user: User.all.sample,
    )
    url16 = "https://steylertour.files.wordpress.com/2016/04/pena-national-palace-sintra.jpg?w=256&h=256&crop=1"
    p url16
    file = URI.open(url16)
    sintra.photo.attach(io: file, filename: "16.jpg", content_type: 'image/jpg')

      barcelona = Group.create!(
      name: 'Barcelona Fans',
      description: 'Ganar ganar ganar',
      user: User.all.sample,
    )
    url17 = "https://a.thumbs.redditmedia.com/ahDFuCfcFr6xO0H8KLG7syxK_B3zamgiP45e8Z6FVc8.png"
    p url17
    file = URI.open(url17)
    barcelona.photo.attach(io: file, filename: "17.jpg", content_type: 'image/jpg')


      kim = Group.create!(
      name: 'High Rollers',
      description: 'Win $$ with us',
      user: User.all.sample,
    )
    url18 = "https://www.worldoil.com/media/13506/putin.jpg"
    p url18
    file = URI.open(url18)
    kim.photo.attach(io: file, filename: "18.jpg", content_type: 'image/jpg')


      ricas = Group.create!(
      name: 'Ricardo\'s Fan Club',
      description: 'Bet with us!!!!',
      user: User.all.sample,
    )
    url19 = "https://www.iol.pt/multimedia/oratvi/multimedia/imagem/id/13416503/600"
    p url19
    file = URI.open(url19)
    ricas.photo.attach(io: file, filename: "19.jpg", content_type: 'image/jpg')

      compa = Group.create!(
      name: 'España',
      description: 'LO MEJOR grupo de Euromilliones',
      user: User.all.sample,
    )
    url20 = "https://espanadowntown.com/wp-content/uploads/2019/04/Logo-with-country-300x169.png"
    p url20
    file = URI.open(url20)
    compa.photo.attach(io: file, filename: "20.png", content_type: 'image/png')


########################## End of Groups ###################################

puts 'Adding members to groups'
  120.times do
    GroupUser.create(
      user: User.all.sample,
      group: Group.all.sample
    )
  end

puts "Placing 60 bets"

  60.times do
    Bet.create!(
    numbers: [rand(1..10), rand(11..20), rand(21..30), rand(31..40), rand(41..50)],
    stars: [rand(1..4), rand(5..12)],
     payed: true,
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
      first_name: 'Chuck',
      last_name: 'Norris',
      username: 'chuck_norris666',
      user: demo,
      date_of_birth: 19610925,
      nif: 223451789,
      bio: '55555',
    )
    picture = URI.open('https://i.ytimg.com/vi/Upems4CB_ps/maxresdefault.jpg')
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
     payed: true,
     user: demo,
     group: demo.groups.sample,
     draw: Draw.all.sample
    )
  end

puts 'Finished!'
