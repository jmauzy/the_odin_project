def cipher(text, shift)
	container = []
	holder = []
	result = []
	text.chars.each do |a|
		container.push(a.ord)			#Convert each character to ordinal value
	end
	container.each do |a|
		if a.between?(65, 90)			#Case for capital letters
			if a + shift <= 90 	#Falls within bounds of alphabet
				holder.push(a 	+ shift)
			else						#Wrap
				holder.push(a + shift - 26)
			end
		elsif a.between?(97, 122)		#Case for lowercase letters
			if a + shift <= 122
				holder.push(a + shift)
			else
				holder.push(a + shift - 26)
			end
		else
			holder.push(a)				#All non-letter characters remain unchanged
		end
	end
holder.each do |v|
	result.push(v.chr)					#Convert back to characters
end
return result.join
end