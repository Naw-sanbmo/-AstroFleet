Spaceship.destroy_all
User.destroy_all

owner = User.create!(
  first_name: "Buzz",
  last_name: "Lightyear",
  email: "buzz@starfleet.com",
  password: "password123"
)

spaceships = [
  {
    name: "Enterprise",
    price: 1_200_000,
    max_speed: 300_000,
    size: "large",
    features: "Holodeck, Warp drive, Saucer separation, Replicators, Photon torpedoes, Android crew member",
    photo: "https://res.cloudinary.com/dhzfni0by/image/upload/v1747717591/Enterprise_u036lv.jpg"
  },
  {
    name: "Death Star",
    price: 2_147_483_647,
    max_speed: 24_000,
    size: "huge",
    features: "Planet-destroying superlaser, Thermal exhaust vent, Droid command center, Tractor beam array",
    photo: "https://res.cloudinary.com/dhzfni0by/image/upload/v1747717591/Death_Star_um6qyo.jpg"
  },
  {
    name: "Event Horizon",
    price: 1_200_000_000,
    max_speed: 500_000,
    size: "experimental cruiser",
    features: "Gravity drive, Hull breach mode, Distress beacon, Interdimensional travel, Crew-induced madness",
    photo: "https://res.cloudinary.com/dhzfni0by/image/upload/v1747717591/Event_Horizon_s0tta4.jpg"
  },
  {
    name: "USCSS Nostromo",
    price: 42_000_000,
    max_speed: 153_300,
    size: "hauler-class",
    features: "Towing rig, AI mainframe (MU-TH-UR 6000), Cryosleep pods, Industrial refinery, Xenomorph passenger",
    photo: "https://res.cloudinary.com/dhzfni0by/image/upload/v1747717591/Nostromo_wjlozk.jpg"
  },
  {
    name: "Eagle 5",
    price: 28_000,
    max_speed: 150_000,
    size: "Space Winnebago",
    features: "Wings, Radar dish, Lone Starr’s piloting, Barf-proof upholstery, Coffee machine, Mega-maid escape capability",
    photo: "https://res.cloudinary.com/dhzfni0by/image/upload/v1747717590/Eagle_5_bfey5t.webp"
  },
  {
    name: "Millennium Falcon",
    price: 15_000_000,
    max_speed: 350_000,
    size: "YT-1300 light freighter",
    features: "Smuggling compartments, Quad laser turrets, Hyperdrive (when it works), Holo-chess table, Kessel Run record",
    photo: "https://res.cloudinary.com/dhzfni0by/image/upload/v1747717591/Millenium_Falcon_fc1bsk.jpg"
  }
]

spaceships.each do |attrs|
  Spaceship.create!(attrs.merge(user: owner))
end

puts "🌌 Seeded #{Spaceship.count} spaceships for Commander #{owner.first_name} #{owner.last_name}"

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
  }
]

bookings.each do |attrs|
  Booking.create!(attrs)
end

puts "📅 Seeded #{Booking.count} spaceship bookings for #{booker.first_name} #{booker.last_name}"
