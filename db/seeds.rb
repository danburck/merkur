# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

# distance of each planet in our solar system from Earth in Astronomical units"
$distances = { 
	"mercury" => 0.39,
	"venus" => 0.72,
	"earth" => 1.00,
	"mars" => 1.52,
	"87 sylvia" => 2.87,
	"243 ida" =>  3.25,
	"216 kleopatra" => 3.56, 
	"50000 quaoar" => 4.12,
	"136472 makemake" => 4.12,
	"45 eugenia" => 4.2,
	"jupiter" => 5.20,
	"saturn" =>9.58,
	"uranus" => 19.20,
	"90482 orcus" => 29.21,
	"neptune" => 30.05,
	"pluto" => 39.48,
	"136108 haumea" => 49.75,
	"136199 eris" => 96.56,
}

$translations = {
	"mercure" => "mercury",
	"vénus" => "venus",
	"terre" => "earth",
	"mars" => "mars",
	"jupiter" => "jupiter",
	"saturne" => "saturn",
	"uranus" => "uranus",
	"neptune" => "neptune",
	"pluton" => "pluto",
	"haumea" => "136108 haumea",
	"eris" => "136199 eris",
	"eugenia" => "45 eugenia",
	"sylvia" => "87 sylvia",
	"orcus" => "90482 orcus",
	"ida" => "243 ida",
	"kleopatra" => "216 kleopatra",
	"quaoar" => "50000 quaoar",
	"makemake" => "136472 makemake"
}

# To interpolate into such a string: "The atmospheric conditions on #{planet.name} are #{} "
$weather = [
	"extremely hot",
	"below freezing",
	"mild",
	"clear",
	"mostly sunny",
	"cloudy",
	"windy",
	"extremely windy",
	"dangerously unpredictable",
	"very wet",
	"scorchingly hot",
	"muggy",
	"steamy",
	"arid",
	"insufferably cold",
	"beautiful",
	"bright and sunny",
	"mostly cloudless",
	"gentle",
	"gloomy",
	"bitterly cold",
	"devastatingly cold",
	"unforgiving",
	"icy",
	"unrelenting",
	"harsh",
	"thunderous",
	"blizzardous",
	"crystallised by frost",
	"foggy"
]

planets_url = open("https://api.le-systeme-solaire.net/rest/bodies/").read
$planets_json = JSON.parse(planets_url)


def body_builder(index)
	body = $planets_json["bodies"][index]
	unless body["englishName"].nil? || body["englishName"] == ""
		name = body["englishName"].downcase

	else
		name = body["name"].downcase
	end
	unless body["aroundPlanet"].nil?
		nearest_planet_french = body["aroundPlanet"]["planet"].downcase
		if !($translations.has_key?(nearest_planet_french))
			binding.pry
		else
			nearest_planet = $translations[nearest_planet_french]
		end
	else
		nearest_planet = name
	end
	
	if $distances.has_key?(name)
		distance = $distances[nearest_planet]
	elsif $distances.has_key?(nearest_planet)
		plus_or_minus = rand(1..2)
		case plus_or_minus
		when 1
			distance = $distances[nearest_planet] + rand(2.3..6.6)
		when 2
			distance = $distances[nearest_planet] - rand(3.7..6.4)
		end
	else
		distance = rand(21.05..52.05)
	end
	capacity = rand(50..100)
	climate = $weather.sample
	discovery_date = body["discoveryDate"]
	body["discoveredBy"].empty? ? discovered_by = nil : discovered_by = body["discoveredBy"]
	is_planet = body["isPlanet"]
	gravity = body["gravity"]
	cost_per_day = rand(10..150)
	body = Body.create!({
		name: name,
		nearest_planet: nearest_planet,
		distance: distance,
		capacity: capacity,
		climate: climate,
		discovery_date: discovery_date,
		discovered_by: discovered_by,
		is_planet: is_planet,
		gravity: gravity,
		cost_per_day: cost_per_day
	})
	puts "🪐 Creating #{body.name.titleize}"
end

index = 0

286.times do
	body_builder(index)
	index += 1
end

