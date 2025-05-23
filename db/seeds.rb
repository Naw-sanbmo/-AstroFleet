require "open-uri"

puts "🧹 Clearing database..."
Booking.destroy_all
Spaceship.destroy_all
User.destroy_all

puts "👤 Creating user..."
owner = User.create!(
  first_name: "Buzz",
  last_name: "Lightyear",
  email: "buzz@starfleet.com",
  password: "password123"
)

10.times do |number|
  User.create!(
    first_name: "Space",
    last_name: "Traveler #{number}",
    email: "spacetraveler#{number}@starfleet.com",
    password: "password123"
  )
end

puts "🚀 Creating spaceships..."

spaceships = [
  {
    name: "Enterprise",
    price: 1_200_000,
    max_speed: 300_000,
    size: "large",
    features: "Holodeck, Warp drive, Saucer separation, Replicators, Photon torpedoes, Android crew member",
    photo: "https://startrekfleetcommand.com/wp-content/uploads/2021/05/TNG_LoadingScreen03.png",
    description: "Flagship of the United Federation of Planets, equipped with advanced tech and diplomacy skills.",
    rating: 5
  },
  {
    name: "Death Star",
    price: 2_147_483_647,
    max_speed: 24_000,
    size: "mega big",
    features: "Planet-destroying superlaser, Thermal exhaust vent, Droid command center, Tractor beam array",
    photo: "https://www.stickyminds.com/sites/default/files/article/2014/death-star.jpg",
    description: "A moon-sized imperial battle station capable of annihilating entire planets.",
    rating: 4
  },
  {
    name: "Event Horizon",
    price: 1_200_000_000,
    max_speed: 500_000,
    size: "medium",
    features: "Gravity drive, Hull breach mode, Distress beacon, Interdimensional travel, Crew-induced madness",
    photo: "https://www.giantfreakinrobot.com/wp-content/uploads/2020/02/event-horizon-900x522.jpg",
    description: "A terrifying experimental ship that folds space... and minds.",
    rating: 3
  },
  # URL didn't work
  # {
  #   name: "USCSS Nostromo",
  #   price: 42_000_000,
  #   max_speed: 153_300,
  #   size: "medium",
  #   features: "Towing rig, AI mainframe (MU-TH-UR 6000), Cryosleep pods, Industrial refinery, Xenomorph passenger",
  #   photo: "https://res.cloudinary.com/dhzfni0by/image/upload/v1747717591/Nostromo_wjlozk.jpg",
  #   description: "Industrial hauler ship from Weyland-Yutani, haunted by unexpected alien cargo.",
  #   rating: 4
  # },
  {
    name: "Eagle 5",
    price: 28_000,
    max_speed: 150_000,
    size: "small",
    features: "Wings, Radar dish, Lone Starr’s piloting, Barf-proof upholstery, Coffee machine, Mega-maid escape capability",
    photo: "https://wallpapers.com/images/hd/spaceballs-dg4gamkof51ci5c6.jpg",
    description: "A Winnebago in space. Surprisingly durable, endlessly meme-worthy.",
    rating: 2
  },
  {
    name: "Tie Interceptor",
    price: 23_000,
    max_speed: 180_000,
    size: "Space Winnebago",
    features: "Wings, Radar dish, Lone Starr’s piloting, Barf-proof upholstery, Coffee machine, Mega-maid escape capability",
    photo: "https://i.pinimg.com/736x/02/20/b3/0220b306531f5c22b4bc6ca1a3502261.jpg",
    description: "A Winnebago in space. Surprisingly durable, endlessly meme-worthy.",
    rating: 3
  },
  {
    name: "X-wing Starfighter",
    price: 25_000,
    max_speed: 350_000,
    size: "Space Winnebago",
    features: "Wings, Radar dish, Lone Starr’s piloting, Barf-proof upholstery, Coffee machine, Mega-maid escape capability",
    photo: "https://img.freepik.com/free-photo/view-futuristic-looking-spacecraft_23-2150675563.jpg?semt=ais_hybrid&w=740",
    description: "A Winnebago in space. Surprisingly durable, endlessly meme-worthy.",
    rating: 4
  },
  {
    name: "Razor Crest",
    price: 40_000,
    max_speed: 250_000,
    size: "Space Winnebago",
    features: "Wings, Radar dish, Lone Starr’s piloting, Barf-proof upholstery, Coffee machine, Mega-maid escape capability",
    photo: "https://cdn.mos.cms.futurecdn.net/eJCVbwUPfV9Mx7sH7bdPRj.jpg",
    description: "A Winnebago in space. Surprisingly durable, endlessly meme-worthy.",
    rating: 5
  },
  {
    name: "Imperial Star Destroyer",
    price: 30_000,
    max_speed: 200_000,
    size: "Space Winnebago",
    features: "Wings, Radar dish, Lone Starr’s piloting, Barf-proof upholstery, Coffee machine, Mega-maid escape capability",
    photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBHfe3SPdBD2xOEdMfIueRjB8ZuPwGqiDujw&s",
    description: "A Winnebago in space. Surprisingly durable, endlessly meme-worthy.",
    rating: 4
  },
  {
    name: "Starfox Airwing",
    price: 38_000,
    max_speed: 250_000,
    size: "Space Winnebago",
    features: "Wings, Radar dish, Lone Starr’s piloting, Barf-proof upholstery, Coffee machine, Mega-maid escape capability",
    photo: "https://bookbub-res.cloudinary.com/image/upload/w_1200,h_628,c_fill,g_auto,f_auto,q_auto/v1689780563/blog/the-most-fascinating-spaceships-in-science-fiction-share.jpg",
    description: "A Winnebago in space. Surprisingly durable, endlessly meme-worthy.",
    rating: 4
  },
  {
    name: "Ranger",
    price: 38_000,
    max_speed: 280_000,
    size: "Space Winnebago",
    features: "Wings, Radar dish, Lone Starr’s piloting, Barf-proof upholstery, Coffee machine, Mega-maid escape capability",
    photo: "https://images.saymedia-content.com/.image/ar_16:9%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTk2ODg5NjQ5OTk2NzAyOTc5/largest-spaceships-science-fiction.jpg",
    description: "A Winnebago in space. Surprisingly durable, endlessly meme-worthy.",
    rating: 5
  },
  {
    name: "Alien Slave Ship",
    price: 20_000,
    max_speed: 24_000,
    size: "Experimental cruiser",
    features: "Wings, Radar dish, Lone Starr’s piloting, Barf-proof upholstery, Coffee machine, Mega-maid escape capability",
    photo: "https://cdna.artstation.com/p/assets/images/images/033/453/542/large/vitaliy-ostaschenko-renderendevour6.jpg?1609671428",
    description: "A Winnebago in space. Surprisingly durable, endlessly meme-worthy.",
    rating: 4
  }
]

spaceships.each do |attrs|
  p attrs[:photo]
  file = URI.parse(attrs[:photo]).open


  spaceship = Spaceship.new(
    name: attrs[:name],
    price: attrs[:price],
    max_speed: attrs[:max_speed],
    size: attrs[:size],
    features: attrs[:features],
    description: attrs[:description],
    rating: attrs[:rating],
    user: User.all.sample
  )

  spaceship.photo.attach(io: file, filename: "#{attrs[:name]}.png", content_type: "image/png")

  spaceship.save

  puts "✅ Created #{spaceship.name}"
end

puts "🌌 Finished seeding #{Spaceship.count} spaceships for Commander #{owner.first_name} #{owner.last_name}"


# Pick one booker to keep things simple
booker = User.create!(
  first_name: "Han",
  last_name: "Solo",
  email: "han@falcon.space",
  password: "password123"
)

bookings = [
  {
    spaceship: Spaceship.all.sample,
    user: booker,
    start_date: Date.today + 1,
    end_date: Date.today + 5,
    total_price: 200_000
  },
  {
    spaceship: Spaceship.all.sample,
    user: booker,
    start_date: Date.today + 10,
    end_date: Date.today + 12,
    total_price: 1_000_000
  },
 {
    spaceship: Spaceship.all.sample,
    user: booker,
    start_date: Date.today + 3,
    end_date: Date.today + 7,
    total_price: 300_000
  },
    {
    spaceship: Spaceship.all.sample,
    user: booker,
    start_date: Date.today - 20,
    end_date: Date.today - 15,
    total_price: 28_000
  },

      {
    spaceship: Spaceship.all.sample,
    user: booker,
    start_date: Date.today - 98,
    end_date: Date.today - 94,
    total_price: 1_200_000_000
  }
]

bookings.each do |attrs|
  Booking.create!(attrs)
end

puts "📅 Seeded #{Booking.count} spaceship bookings for #{booker.first_name} #{booker.last_name}"
