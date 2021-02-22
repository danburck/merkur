# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

planets_url = open("https://api.le-systeme-solaire.net/rest/bodies/").read
planets_json = JSON.parse(planets_url)

def body_builder(index)
	body = planets_json["bodies"][index]
	pl
end
	index = rand(0..285)
	body = planets_json["bodies"][index]
	planet_name = body["englishName"]
end while planet_name.nil?

286.times do |body|
	index = 0
	body_builder(index)
