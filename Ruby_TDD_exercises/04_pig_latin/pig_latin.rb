def translateWord(text)
vowels = ['a', 'e', 'i', 'o', 'u']
word_array = text.split('')
result = []
while vowels.include?(word_array[0]) == false
	if word_array[0] == "q" and word_array[1] == "u"
		result.push(word_array.shift(2))
	else
		result.push(word_array.shift)
	end
end
	return word_array.join+result.join+"ay"
end

def translate(text)
	result = []
	words = text.split(" ")
	words.each { |w| result.push(translateWord(w)) }
	return result.join(" ")
end
		



	