def factorial(n)
	if n == 0
		n
	else
		n * factorial(n-1)
	end
end

factorial(5)
	