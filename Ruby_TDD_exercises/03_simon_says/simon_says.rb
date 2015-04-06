def echo(text)
	return text
end

def shout(text)
	return text.upcase
end

def repeat(text, n=2)
	result = []
	n.times {result << text}
	return result.join(' ')
end

def start_of_word(text, n=1)
	return text[0..n-1]
end

def first_word(text)
	result=''
	text.each_char do |n|
		return result if n == ' '
		result += n
	end
	return result
end

def titleize(text)
	words =  text.downcase.split
	words[0].capitalize!
	words.each do |t|
		case t
		when 'and'
		when 'in'
		when 'of'
		when 'the'
		when 'over'
		when 'on'
		else t.capitalize!
		end
	end
	return words.join(' ')	
end