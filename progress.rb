def progress
	0.step(100, 10) { |p| yield p }
end

progress { |percent| puts percent }

def greet
	yield "Larry"
end

greet { |name, age| puts "Hello #{name} You don't look #{age}"}