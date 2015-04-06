def factorial(n) #returns the factorial value of n
	if n <= 0
		1
	else
		n * factorial(n-1)
	end
end


def palindrome(str) #checks if string is a palindrome
	if str == nil || str.length == 1
		return true
	end
	if str[0] == str[-1]
		palindrome(str[1..-2])
	else
		return false
	end
end

def bottles(n)
	if n <= 0
		puts "No more bottles of beer on the wall!"
	else
		puts "#{n} bottles of beer on the wall"
		bottles(n-1)
	end
end

def fib(n) #gives n digit of fib sequence
	if n == 0
		0
	elsif n == 1
		1
	else fib(n-1) + fib(n-2)
	end
end

def flatten(arr, result = []) #flattens nested arrays into a single array
	arr.each do |i|
		if i.kind_of?(Array)
			flatten(i, result)
		else
			result << i
		end
	end
	result
end


