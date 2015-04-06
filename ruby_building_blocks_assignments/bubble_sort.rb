def bubble_sort(arr)
	(arr.length-1).times do
		arr.each_with_index do |n, index|
			if arr[index+1] && arr[index] > arr[index+1]
					arr[index], arr[index+1] = arr[index+1], arr[index]
			end
		end
	end
return arr	
end

def bubble_sort_by(arr)	
	if block_given?
		(arr.length-1).times do
			arr.each_with_index do |n, index|
				if arr[index+1] && yield(n, arr[index+1]) > 0
					arr[index], arr[index+1] = arr[index+1], arr[index]
				end
			end
		end
	end
return arr
end			