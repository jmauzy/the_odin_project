class Mastermind
	def initialize
		@solution = []
		@max_value = 5
		@num_digits = 4
		@guess_number = 1
		@current_guess
		@feedback = []
	end
	
	def start
		welcome
		create_code
		#puts @solution.inspect
		game_loop
	end
	
	def welcome
		system "clear"
		puts "***************************************************************************"
		puts "Welcome to Mastermind!"
		puts "There are two players in this game: The codemaster and the codebreaker."
		puts "After the codemaster chooses their secret code, the codebreaker will have ten"
		puts "chances to guess it. The codebreaker will receive clues after each guess"
		puts "that will tell them how close their guess was to the master code! An 'X' "
		puts "indicates that you have a correct number in a correct position. An 'O' means"
		puts "you have a correct number in an incorrect position"
		puts "The computer will play the codemaster. Good Luck!"
		puts "***************************************************************************"
	end
	
	def create_code
		@num_digits.times { @solution << rand(1..@max_value) }
	end
	
	def game_loop
	guess_holder = []
		while @guess_number <= 10
			puts "Make a guess: (#{@num_digits} digits, 1-#{@max_value}, without spaces)"
			@current_guess = gets.chomp.split("").map {|n| n.to_i}
			sanitize_input
			check_guess
			@guess_number += 1
		end
		game_over
	end
	
	def check_guess
		if @current_guess == @solution
			victory
		else
			get_feedback
			put_feedback
		end
	end
	
	def sanitize_input
		@current_guess.each do |i|
			if @current_guess.length != @num_digits || !i.between?(1,@max_value)
				bad_solution
			end
		end
	end
	
	def bad_solution
		puts "Sorry, that is not a valid entry, please try again"
		puts
		game_loop
	end
	
	def get_feedback
		@feedback = []
		guess_mask =[]
		@num_digits.times { guess_mask << true }
		code_mask = []
		@num_digits.times { code_mask << true }
		right_place = 0
		wrong_place = 0
		wrong_num = 4
		@current_guess.each_with_index do |n, i|
			if @current_guess[i] == @solution[i]
				right_place += 1
				wrong_num -= 1
				guess_mask[i] = false
				code_mask[i] = false
			end
		end
		@current_guess.each_with_index do |n, i|
			@solution.each_with_index do |m, j|
				if guess_mask[i] && code_mask[j]
					if @current_guess[i] == @solution[j]
						wrong_place += 1
						wrong_num -= 1
						guess_mask[i] = false
						code_mask[j] = false
					end
				end
			end
		end
		right_place.times { @feedback << "O" }
		wrong_place.times { @feedback << "X" }
		wrong_num.times {@feedback << "_" }	
	end
	
	def put_feedback
		puts @feedback.inspect
	end
	
	def victory
		puts "You Win! Try again? (y/n)"
		if gets.chomp == "y"
			new_game = Mastermind.new
			new_game.start
		else
			puts "Thanks for playing!"
			exit
		end
	end
			
	def game_over
		puts "Game Over! The correct code was #{@solution.join}. Try again? (y/n)"
		if gets.chomp == "y"
			new_game = Mastermind.new
			new_game.start
		else
			puts "Thanks for playing!"
			exit
		end
	end
	
end

new_game = Mastermind.new
new_game.start