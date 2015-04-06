def stock_picker(arr)
	best_pair = []
	best_value = 0
	arr[0..-2].each do |a|
		arr[arr.index(a)..-1].each do |b|
			if b - a > best_value
				best_value = b - a
				best_pair = [arr.index(a), arr.index(b)]
			end
		end
	end
puts "Buy on day #{best_pair[0]} and sell on day #{best_pair[1]} for a profit of #{best_value}"
end
stock_picker([3, 12, 18, 4, 1, 16, 9, 2])
		
		