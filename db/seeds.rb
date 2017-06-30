# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

JsonWeapon.weapons.each do |json_weapon|
  Weapon.create(json_weapon.attributes)
end

JsonGear.gears.each do |json_gear|
  Gear.create(json_gear.attributes)
end