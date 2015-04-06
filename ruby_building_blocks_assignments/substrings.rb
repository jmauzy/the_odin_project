=begin 
**Implement a method #substrings that takes a word as the first argument
and then an array of valid substrings (your dictionary) as the second
argument. It should return a hash listing each substring (case
insensitive) that was found in the original string and how many times
it was found. 
=end

def substrings(text, match)
	hits = Hash.new(0)
	text = text.downcase.split
	text.each do |t|
		match.each do |m|
			if t.include?(m)
				hits[t] += 1
			end
		end
	end
	puts hits

end

match_list = ["below", "down", "go", "going", "horn", "how", "howdy", "it",
 "i", "low", "own", "part", "partner", "sit"]
	
substrings("Howdy partner, sit down! How's it going?", match_list)