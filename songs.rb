require_relative 'my_enumerable.rb'

class Song
	attr_reader :name, :artist, :duration

	def initialize(name, artist, duration)
		@name = name
		@artist = artist
		@duration = duration
	end
	
	@@file_types = ["mp3","wav","aac"]

	def play
		puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
	end
	
	def each_filename
		@@file_types.each do |filename|
			yield "#{self.name.gsub(" ", "-")}.#{filename}"
		end
	end
	
	def to_s 
		puts "Song name: #{name} Song artist: #{artist} Play time: #{duration}"
	end
end

song1 = Song.new("Outside Woman Blues","Cream",3.55)
song2 = Song.new("The House Of The Rising Sun", "The Animals",4.53)
song3 = Song.new("Your Time Is Gonna Come","Led Zeppelin", 4.34)
song4 = Song.new("Touch Me","The Doors",3.12)
song5 = Song.new("Roadhouse Blues","The Doors",4.39)
song6 = Song.new("L.A. Woman","The Doors",2.59)

class Playlist
	#include Enumerable
	include MyEnumerable
	def initialize(name)
		@name = name
		@songs = []
	end
	
	def each
		@songs.each do |song|
			yield song
		end
	end
	
	def play_songs
		@songs.each do |song|
			song.play
		end
	end
	
	def each_tagline
		@songs.select do |song|
			yield "#{song.name} - #{song.artist}"			
		end
	end
	
	def each_by_artist(name)
		@songs.each do |song|
			if song.artist == name
				yield song
			end
		end
	end

	def add_song(song)
		@songs << song
	end
end

playlist1 = Playlist.new("favorite_songs")
playlist1.add_song song1
playlist1.add_song song2
playlist1.add_song song3
playlist1.add_song song4
playlist1.add_song song5
playlist1.add_song song6

#playlist1.each { |song| song.play }
puts "Play the songs"
playlist1.play_songs
puts "End playlist"
puts "************"

puts "My Song"
my_song = playlist1.select {|song| song.name =~ /House/ }
puts my_song
puts "End my song"
puts "************"

reject_songs = playlist1.reject { |song| song.name =~ /Touch/}
puts reject_songs
puts "************"

puts playlist1.detect {|song| song.artist == "Cream"}
puts "************"

puts "Any artist Led Zeppelin"
puts  playlist1.any?{|song| song.artist == "Led Zeppelin"}

artists = playlist1.map{ |song| song.artist }
puts artists
puts "************"

puts "Total Play time"
total_playtime = playlist1.map{|song| song.duration}.reduce(:+)
puts total_playtime
puts "************"

puts "Song tagline"
puts "-------------"
playlist1.each_tagline { |tagline| puts tagline}
puts "-------------"

puts "Songs by Artist"
puts "-------------"
playlist1.each_by_artist("The Doors") {|song| song.play}
puts "-------------"

puts "File Types"
puts "-------------"
playlist1.each_by_artist("The Doors") {|song| song.each_filename { |filename| puts filename } }
puts "-------------"

