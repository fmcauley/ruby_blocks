class Flyer
	attr_reader :name, :email, :miles_flown
	attr_accessor :status
	
	def initialize(name,email,miles_flown, status=:bronze)
		@name = name
		@email = email
		@miles_flown = miles_flown
		@status = status
	end
	
	def to_s
		"#{name} (#{email}): #{miles_flown} - #{status}"
	end
end

flyers = []
flyers << Flyer.new("Larry", "larry@example.com",4000,:platinum)
flyers << Flyer.new("Moe", "moe@example.com",1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com",2000)

most_miles = flyers.select{ |f| f.miles_flown >= 3000}
puts "Most Miles Flown"

puts most_miles

less_miles = flyers.reject{ |f| f.miles_flown >= 3000}
puts "Less Miles Flown"
puts less_miles

puts "Status == platinum"
puts flyers.any?{ |f| f.status == :platinum}

puts "Worst"
puts flyers.detect{ |f| f.status == :bronze}

puts "Flying status"
platinum_flyers, poor_sods = flyers.partition { |f| f.status == :platinum}
puts "The Platinum Flyers"
puts platinum_flyers
puts "The other Poor sods"
puts poor_sods

name_tag = flyers.map{ |f| "#{f.name} (#{f.status})".upcase}
puts name_tag

distance_flown = flyers.map{ |f| f.miles_flown * 1.6 }
puts "Distances in kilometers"
puts distance_flown

puts "Total Distance flown in kilometers"
puts distance_flown.reduce(0) { |sum, distance| sum + distance }

puts "Miles flown"
puts flyers.map{ |f| f.miles_flown }.reduce(:+)

puts "All the Bronze Flyers:"
#My answer
bronze_flyers = flyers.select{ |f| f.status == :bronze}.reduce(0){|sum, f| sum + (f.miles_flown * 1.6)}
#theirs
more_bronze = flyers.select { |f| f.status == :bronze}.map{ |f| f.miles_flown * 1.6 }.reduce(:+)

puts bronze_flyers
puts more_bronze
