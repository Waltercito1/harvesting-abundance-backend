# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "walter_aab", first_name: "Walter", last_name: "Aab", email: "aabwalter@yahoo.com", password: "password!!!", street: "613 Victoria Ln.", city: "Wood Dale", state: "IL", zipcode: 60191)
User.create(username: "dario_losa", first_name: "Dario", last_name: "Losa", email: "losadario@gmail.com", password: "password!!!", street: "1001 Summerfield Dr.", city: "Roselle", state: "IL", zipcode: 60172)
User.create(username: "jane_lopez", first_name: "Jane", last_name: "Lopez", email: "janelopez@gmail.com", password: "password!!!", street: "250 W George St", city: "Itasca", state: "IL", zipcode: 60143)

tree_a = Tree.create(name: "Black mulberry", description: "These trees are on public land and the berries are great.")
tree_b = Tree.create(name: "Pear", description: "This tree is in private property. Contact me to collect.")
tree_c = Tree.create(name: "Blackberry", description: "The beeries are ripe in July. Public land.")
tree_d = Tree.create(name: "European crabapple", description: "These trees are by a beautiful park.")

location_a = Location.create(latitude: "41.961546", longitude: "-88.017025")
location_b = Location.create(latitude: "41.959387", longitude: "-88.003092")
location_c = Location.create(latitude: "41.956882", longitude: "-88.005688")

harvest_site_a = HarvestSite.create(tree: tree_a, location: location_a, user_id: 1)
harvest_site_b = HarvestSite.create(tree: tree_b, location: location_b, user_id: 2)
harvest_site_c = HarvestSite.create(tree: tree_c, location: location_a, user_id: 3)
harvest_site_d = HarvestSite.create(tree: tree_d, location: location_c, user_id: 1)
harvest_site_e = HarvestSite.create(tree: tree_a, location: location_b, user_id: 2)