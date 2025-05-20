# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear out old data first (optional)
# Clear existing records (optional in development)
Spaceship.destroy_all
User.destroy_all

# Create demo owner
owner = User.create!(
  first_name: "Buzz",
  last_name: "Lightyear",
  email: "buzz@starfleet.com",
  password: "password123"  # Required by Devise
)

# Create some spaceships
spaceships = [
  {
    name: "Falcon X9",
    price: 120_000,
    max_speed: 30_000,
    size: "large",
    features: "Hyperdrive, Auto-Docking, Hologram Interface"
  },
  {
    name: "Nebula Skimmer",
    price: 85_000,
    max_speed: 24_000,
    size: "medium",
    features: "Cloaking system, AI pilot, Gravity stabilizer"
  },
  {
    name: "Solar Whisper",
    price: 45_000,
    max_speed: 18_000,
    size: "small",
    features: "Minimalist pod, Solar sail, Compact living module"
  },
  {
    name: "Cosmic Chariot",
    price: 110_000,
    max_speed: 27_000,
    size: "large",
    features: "Luxury cabin, Laser turrets, Party dome"
  },
  {
    name: "Asteroid Hopper",
    price: 32_000,
    max_speed: 15_000,
    size: "small",
    features: "Tight maneuvering, Light armor, Compact scanner"
  }
]

spaceships.each do |attrs|
  Spaceship.create!(attrs.merge(user: owner))
end

puts "🌌 Seeded #{Spaceship.count} spaceships for Commander #{owner.first_name} #{owner.last_name}"
