def add(x, y)
	return x + y
end


def subtract(x, y)
	return x - y
end

def sum(n)
	total = 0
	n.each {|i| total += i}
	return total
end

def multiply(*n)
	total = 1
	n.each { |i| total *= i }
	return total
end

def power(x,y)
	return x ** y
end

def factorial(x)
	count = x
	total = 1
	until count < 1
		total = total * count
		count -= 1
	end
	return total
end 
