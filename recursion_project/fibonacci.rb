#Both methods return the first n digits of the fibonacci sequence.

def fibs(n) #Uses iterators
	return [0] if n == 1
	result = [0, 1]
	(n-2).times do 
		result << result[-1] + result[-2]
	end
	result
end


def fibs_rec(n, result = [0, 1]) #Uses recursion
	return [0] if n == 1
	return result if result.length == n
	result << result[-1] + result[-2]
	fibs_rec(n, result)
end
