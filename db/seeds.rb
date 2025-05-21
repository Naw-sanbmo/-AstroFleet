require "open-uri"

puts "🧹 Clearing database..."
Spaceship.destroy_all
User.destroy_all

puts "👤 Creating user..."
owner = User.create!(
  first_name: "Buzz",
  last_name: "Lightyear",
  email: "buzz@starfleet.com",
  password: "password123"
)

puts "🚀 Creating spaceships..."

spaceships = [
  {
    name: "Enterprise",
    price: 1_200_000,
    max_speed: 300_000,
    size: "large",
    features: "Holodeck, Warp drive, Saucer separation, Replicators, Photon torpedoes, Android crew member",
    photo: "https://res.cloudinary.com/dhzfni0by/image/upload/v1747717591/Enterprise_u036lv.jpg",
    description: "Flagship of the United Federation of Planets, equipped with advanced tech and diplomacy skills.",
    rating: 5
  },
  {
    name: "Death Star",
    price: 2_147_483_647,
    max_speed: 24_000,
    size: "huge",
    features: "Planet-destroying superlaser, Thermal exhaust vent, Droid command center, Tractor beam array",
    photo: "https://res.cloudinary.com/dhzfni0by/image/upload/v1747717591/Death_Star_um6qyo.jpg",
    description: "A moon-sized imperial battle station capable of annihilating entire planets.",
    rating: 4
  },
  {
    name: "Event Horizon",
    price: 1_200_000_000,
    max_speed: 500_000,
    size: "experimental cruiser",
    features: "Gravity drive, Hull breach mode, Distress beacon, Interdimensional travel, Crew-induced madness",
    photo: "https://res.cloudinary.com/dhzfni0by/image/upload/v1747717591/Event_Horizon_s0tta4.jpg",
    description: "A terrifying experimental ship that folds space... and minds.",
    rating: 3
  },
  # {
  #   name: "Millennium Falcon",
  #   price: 15_000_000,
  #   max_speed: 350_000,
  #   size: "YT-1300 light freighter",
  #   features: "Smuggling compartments, Quad laser turrets, Hyperdrive (when it works), Holo-chess table, Kessel Run record",
  #   photo: "https://res.cloudinary.com/dhzfni0by/image/upload/v1747807561/Millenium_Falcon_wdifip.jpg",
  #   description: "Fast, scrappy, and iconic. Beloved by scoundrels and rebels alike.",
  #   rating: 5
  # },
  {
    name: "USCSS Nostromo",
    price: 42_000_000,
    max_speed: 153_300,
    size: "hauler-class",
    features: "Towing rig, AI mainframe (MU-TH-UR 6000), Cryosleep pods, Industrial refinery, Xenomorph passenger",
    photo: "https://res.cloudinary.com/dhzfni0by/image/upload/v1747717591/Nostromo_wjlozk.jpg",
    description: "Industrial hauler ship from Weyland-Yutani, haunted by unexpected alien cargo.",
    rating: 4
  },
  {
    name: "Eagle 5",
    price: 28_000,
    max_speed: 150_000,
    size: "Space Winnebago",
    features: "Wings, Radar dish, Lone Starr’s piloting, Barf-proof upholstery, Coffee machine, Mega-maid escape capability",
    photo: "https://res.cloudinary.com/dhzfni0by/image/upload/v1747717590/Eagle_5_bfey5t.webp",
    description: "A Winnebago in space. Surprisingly durable, endlessly meme-worthy.",
    rating: 2
  },
]


spaceships.each do |attrs|
  file = URI.parse(attrs[:photo]).open

  spaceship = Spaceship.new(
    name: attrs[:name],
    price: attrs[:price],
    max_speed: attrs[:max_speed],
    size: attrs[:size],
    features: attrs[:features],
    description: attrs[:description],
    rating: attrs[:rating],
    user: owner
  )

  spaceship.photo.attach(
    io: file,
    filename: "#{attrs[:name].parameterize}.png",
    content_type: "image/png"
  )

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
    spaceship: Spaceship.find_by(name: "Enterprise"),
    user: booker,
    start_date: Date.today + 1,
    end_date: Date.today + 5,
    total_price: 200_000
  },
  {
    spaceship: Spaceship.find_by(name: "Death Star"),
    user: booker,
    start_date: Date.today + 10,
    end_date: Date.today + 12,
    total_price: 1_000_000
  },
  {
    spaceship: Spaceship.find_by(name: "Millennium Falcon"),
    user: booker,
    start_date: Date.today + 3,
    end_date: Date.today + 7,
    total_price: 300_000
  },
    {
    spaceship: Spaceship.find_by(name: "Eagle 5"),
    user: booker,
    start_date: Date.today - 20,
    end_date: Date.today - 15,
    total_price: 28_000
  },
      {
    spaceship: Spaceship.find_by(name: "Event Horizon"),
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
