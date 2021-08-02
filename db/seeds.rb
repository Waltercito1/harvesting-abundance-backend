# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tree_a = Tree.create(type: "Black mulberry", description: "These trees are on public land and the berries are great.")
tree_b = Tree.create(type: "Pear", description: "This tree is in private property. Contact me to collect.")
tree_c = Tree.create(type: "Blackberry", description: "The beeries are ripe in July. Public land.")
tree_d = Tree.create(type: "European crabapple", description: "These trees are by a beautiful park.")

location_a = Location.create(latitude: "41.961546", longitude: "-88.017025")
location_b = Location.create(latitude: "41.959387", longitude: "-88.003092")
location_c = Location.create(latitude: "41.956882", longitude: "-88.005688")

harvest_site_a = HarvestSite.create(tree: tree_a, location: location_a)
harvest_site_b = HarvestSite.create(tree: tree_b, location: location_b)
harvest_site_c = HarvestSite.create(tree: tree_c, location: location_a)
harvest_site_d = HarvestSite.create(tree: tree_d, location: location_c)
harvest_site_e = HarvestSite.create(tree: tree_a, location: location_b)