class Book
	attr_reader :title
	def title= title
		@title = capitalize(title)
	end

	def capitalize(title)
	exempt = ['a', 'and', 'the', 'in', 'of', 'an']
		words = title.split(' ')
			words[0].capitalize!
			words.each do |w|
				if exempt.include?(w) == false
					w.capitalize!
				end
			end
	return words.join(' ')
	end
end