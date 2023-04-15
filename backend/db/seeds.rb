# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create admin
User.create(email: "admin@gmail.com", password: "123456", password_confirmation: "123456", role: 1)

# Create repair equipments
RepairEquipment.create(name: "Thiết bị điện")
RepairEquipment.create(name: "Thiết bị điện tử")
RepairEquipment.create(name: "Thiết bị điện lạnh")
RepairEquipment.create(name: "Thiết bị nước")
