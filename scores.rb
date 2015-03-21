puts "Scores doubled"
scores = [83,71,92,64,98,87,75,69]
scores_doubled = scores.map { |s| s*2}
puts scores_doubled

#both version of the reduce method work 
#the second works when we know that 
#the returned object responds to + method

#total = scores.reduce(0){ |sum, score| sum + score}
puts "Score total"
total = scores.reduce(:+)
puts total

evens, odds = scores.partition { |s| s%2 == 0 }
puts "Events"
puts evens
puts "Odds"
puts odds