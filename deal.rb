def deal(num_deals)
	faces = ["Jack", "Queen", "King", "Ace"]
	suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
		1.upto(num_deals) do |n|
			random_face = faces.sample
			random_suit = suits.sample
			if block_given?
				total_score = yield random_face,random_suit
				puts total_score
			else puts "No deal!"
			end
		end
end

deal(5) do |face, suit| 
  puts "Dealt a #{face} of #{suit}"
    "You scored a #{face.length + suit.length}"
  end
  
def n_times(number)
	1.upto(number) do |n|
		yield n
	end
end

# n_times(5) do |n|
#   puts "#{n} situps"
#   puts "#{n} pushups"
#   puts "#{n} chinups"
# end
	