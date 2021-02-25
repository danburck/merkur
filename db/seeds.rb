# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# distance of each planet in our solar system from Earth in Astronomical units"


Faker::UniqueGenerator.clear

DISTANCES = {
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

TRANSLATIONS = {
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
WEATHER = [
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

BODY_IMAGES = [
  "body_1.jpg"
  "body_2.jpg"
  "body_3.jpg"
  "body_4.jpg"
  "body_5.jpg"
  "body_6.jpg"
  "body_7.jpg"
  "body_8.jpg"
  "body_9.jpg"
]


bodies_url = open("https://api.le-systeme-solaire.net/rest/bodies/").read
bodies_json = JSON.parse(bodies_url)
BODY = bodies_json["bodies"]

def starship_builder(name)
	cost = (rand(5..15) * (rand(1..2) * 5))
	Starship.create!({
		name: name,
		cost: cost
	})
end

def body_builder(body)
	name = get_name(body)
	nearest_planet = get_nearest_planet(body, name)
	distance = get_distance(body, name, nearest_planet)
	capacity = rand(50..100)
	climate = WEATHER.sample
	discovery_date = body["discoveryDate"]
	body["discoveredBy"].empty? ? discovered_by = nil : discovered_by = body["discoveredBy"]
	is_planet = body["isPlanet"]
	gravity = body["gravity"]
	cost_per_day = rand(10..150)
	starship = Starship.find_by(id: rand(1..30))
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
		cost_per_day: cost_per_day,
		starship: starship
	})
	emoji = ["🪐", "☄️ ", "🌌"]
	puts "#{emoji.sample}  Creating #{body.name.titleize}"
end

def get_name(body)
	unless body["englishName"].nil? || body["englishName"] == ""
		body["englishName"].downcase
	else
		body["name"].downcase
	end
end

def get_nearest_planet(body, name)
	unless body["aroundPlanet"].nil?
		nearest_planet_french = body["aroundPlanet"]["planet"].downcase
		nearest_planet = TRANSLATIONS[nearest_planet_french]
	else
		nearest_planet = name
	end
end

def get_distance(body, name, nearest_planet)
	if DISTANCES.has_key?(name)
		distance = DISTANCES[name]
	elsif DISTANCES.has_key?(nearest_planet)
		plus_or_minus = rand(1..2)
		case plus_or_minus
		when 1
			distance = DISTANCES[nearest_planet] + rand(0.0..0.7)
		when 2
			distance = DISTANCES[nearest_planet] - rand(0.0..0.7)
		end
	else
		distance = rand(21.5..52.5)
	end
	distance = distance.round(2)
end

15.times { starship_builder(Faker::Space.unique.constellation) }
15.times { starship_builder(Faker::Space.unique.star) }

BODY.each do |body|
	body_builder(body)
end

def create_users
  puts 'Creating user_1'
  user = User.create(
    email: 'user1@user.com',
    password: '123456',
    first_name: 'Alex',
    last_name: 'Jones',
    origin_planet: 'Earth'
    )
  puts "Created #{user.first_name}, email: #{user.email}, password: #{user.password}"

  puts 'Creating user_2'
  user = User.create(
    email: 'user2@user.com',
    password: '123456',
    first_name: 'Phil',
    last_name: 'Roony',
    origin_planet: 'Earth'
    )
  puts "Created #{user.first_name}, email: #{user.email}, password: #{user.password}"
  puts "Finished!"
end

def create_trips
  puts 'Creating trips.'
  (1..10).to_a.each do |i|
    trip = Trip.create(
      body: Body.find(i),
      user: User.first,
      arrival_date: Date.today,
      departure_date: Date.today + 4,
      travel_cost: 400,
    )
    puts "Created Trip to #{trip.body.name} for user_1"
  end

  puts 'Creating trips.'
  (1..4).to_a.each do |i|
    trip = Trip.create(
      body: Body.find(i),
      user: User.second,
      arrival_date: Date.today,
      departure_date: Date.today + 4,
      travel_cost: 400,
    )
    puts "Created Trip to #{trip.body.name} for user_1"
  end

  puts 'Finished!'
end

create_users
create_trips
