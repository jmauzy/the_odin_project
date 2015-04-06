def merge_sort(arr)
	return arr if arr.length <2
	mid = arr.length / 2
	sorted_l = merge_sort(arr[0..mid-1])
	sorted_r = merge_sort(arr[mid..-1])
	result = []
	while sorted_l.length > 0 && sorted_r.length > 0
		if sorted_l[0] < sorted_r[0]
			result << sorted_l.shift
		else
			result << sorted_r.shift
		end
	end
	return result + sorted_l + sorted_r
end
