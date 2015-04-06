=begin This exercise is intended to recreate common iterator
methods found in Ruby by creating equivalent methods. The
details of this exercise can be found at the following URL:
http://www.theodinproject.com/ruby-programming/advanced-building-blocks
Sample cases are listed below each function.
=end

module Enumerable

	def my_each
		return self unless block_given?
		for i in self 
			yield(i)
		end
	end
	
	def my_each_with_index
		return self unless block_given?
		index = 0
		for i in self
			yield(i, index)
			index += 1
		end
	end
	
	def my_select
	result = []
	return self unless block_given?
		for i in self
			result << i if yield(i)
		end
	return result
	end
	
	def my_all?
	return true unless block_given?
		for i in self
			return false if yield(i) == false
		end
		return true
	end
	
	def my_any?
	return true unless block_given?
		for i in self
			return true if yield(i)
		end
		return false
	end
	
	def my_none?
	return false unless block_given?
		for i in self
			return false if yield(i)
		end
		return true
	end
	
	def my_count
	return self.length unless block_given?
		result = 0
		for i in self
			result += 1 if yield(i)
		end
		return result
	end
	
	def my_map
	return self unless block_given?
		result = []
		for i in self
			result << yield(i)
		end
		return result
	end
	
	def my_inject(result=nil)
	return self unless block_given?
		if result == nil
			result = self[0]
			n = 1
		else
			n = 0
		end
		self[n..self.length].my_each do |i|
			result = yield(result, i)
		end
		return result
	end
	
	def my_map_alt(proc=nil) #my_map with optional proc handling
	return self unless block_given?
		result = []
		if proc
			for i in self
				result << proc.call(yield(i))
			end
		else
			for i in self
				result << yield(i)
			end
		end
		return result
	end
			
			
	
end



#Test cases for my_each method
test_arr = [1, "two", 3.0]
puts "my_each results (should return list of 3 mixed items):"
test_arr.my_each { |a| puts a }
print "\n"

#Test cases for my_each_with_index method
test_arr = [1, "two", 3.0]
puts "my_each_with_index results (should return numbered list of 3 mixed items):"
test_arr.my_each_with_index { |a, index| puts "#{index}. #{a}" }
print "\n"

#Test cases for my_select method
test_arr = ["albert", "bob", "cody", "aaron", "steve"]
puts "my_select resuts (should return [\"albert\"\, \"aaron\"]):"
print test_arr.my_select { |a| a.include?("a") }
print "\n\n"

#Test cases for my_all? method
test_arr_a = [2, 4, 6, 8]
test_arr_b = [2, 4, 5, 8]
puts "my_all? first test (should return true):"
puts test_arr_a.my_all? { |a| a % 2 == 0 }
puts "my_all? second test (should return false):"
puts test_arr_b.my_all? { |a| a % 2 == 0 }
print "\n"

#Test cases for my_any? method
test_arr_a = [2, 4, 6, 8]
test_arr_b = [1, 3, 5, 8]
test_arr_c = [1, 3, 5, 7]
puts "my_any? first test (should return true):"
puts test_arr_a.my_any? { |a| a % 2 == 0 }
puts "my_any? second test (should return true):"
puts test_arr_b.my_any? { |a| a % 2 == 0 }
puts "my_any? third test (should return false):"
puts test_arr_c.my_any? { |a| a % 2 == 0}
print "\n"

#Test cases for my_none? method
test_arr_a = [1, 3, 4, 7]
test_arr_b = [1, 3, 5, 7]
puts "my_none? first test (should return false):"
puts test_arr_a.my_none? { |a| a % 2 == 0 }
puts "my_none? second test (should return true):"
puts test_arr_b.my_none? { |a| a % 2 == 0 }
print "\n"

#Test case for my_count method
test_arr = ["Bob", 2, 3.0, 2]
puts "my_count results (should return 2):"
puts test_arr.count { |a| a == 2 }
print "\n"

#Test case for my_map method
test_arr = [1, 2, 3, 4]
puts "my_map results (should return [2, 4, 6, 8]:"
print test_arr.my_map { |a| a *= 2 }
print "\n\n"

#Test case for my_inject method
test_arr = [1, 2, 3, 4]
puts "my_inject first test (should return 10):"
puts test_arr.my_inject { |tot, a| tot + a }
#Method used for testing my my_inject
def multiply_els(arr)
	arr.inject { |prod, n| prod * n }
end
puts "my_inject second test (should return 24):"
puts multiply_els([1,2,3,4])
print "\n"

#Test case for my_map_alt
test_arr = [1, 2, 3]
double = Proc.new { |n| n *= 2}
puts "my_map_alt first test (should return [12, 14, 16])"
print test_arr.my_map_alt(double) { |a| a + 5 }
print "\n"
puts "my_map_at second test (should return [6, 7, 8])"
print test_arr.my_map_alt {|a| a + 5}
print "\n"