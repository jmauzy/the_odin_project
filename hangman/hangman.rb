require "yaml"

class Hangman
	attr_accessor :answer, :guess_board, :misses
	def initialize
		@answer = get_word
		@guess_board = []
		@misses = []
		(@answer.length).times { @guess_board << "_" }
	end

	def play
		intro
		load_game?
		while true
			turn
		end
		game_over
	end
	
	
	def intro
	system "clear"
		puts "********************************************"
		puts
		puts "           Welcome to Hangman!"
		puts
		puts "********************************************"
		puts "The rules are simple: try to guess the word "
		puts "one letter at a time. Make 6 wrong guesses  "
		puts "and you lose."
		puts "(Press any key to continue or type 'load' to"
		puts "continue your last game)"
	end
	
	def load_game?
		if gets.chomp == "load"
			data = YAML.load(File.read('save.yml'))
			@answer = data[0]
			@guess_board = data[1]
			@misses = data[2]
		end
	end
	
	def get_word
		holder =""
		wordlist = File.readlines("5desk.txt")
		until holder.chomp.length.between?(5, 6) && holder == holder.downcase
			holder = wordlist.sample.chomp
		end
		holder
	end
	
	def game_over
		puts "Game Over!"
		exit
	end
	
	def turn
		draw_board
		guess = get_input
		check_input(guess)
		game_over?		
	end
	
	def draw_board
		system "clear"
		#puts @answer.inspect
		puts @guess_board.join(" ")
		puts @misses.inspect
	end
	
	def get_input
		puts "Guess a letter (a-z) to type 'save' to save your progress and exit: "
				input = gets.chomp
		if input == "save"	
			save_game
		else
			input.downcase[0]
		end
	end
	
	def check_input(guess)
		found = false
		@answer.split("").each_with_index do |a,i|
			if a == guess
				@guess_board[i] = guess
				found = true
			end
		end
		@misses << guess if found == false
	end
	
	def save_game
		queue = [@answer, @guess_board, @misses]
		File.open('save.yml', 'w') { |n| n.write(YAML.dump(queue)) }
		exit
	end
	
	def game_over?
		win if @guess_board.join == @answer
		lose if @misses.length >= 6
	end
	
	def win
		draw_board
		puts "You win!"
		play_again?
	end
	
	def lose
		puts "You lose! The word was '#{@answer.inspect}'."
		play_again?
	end
	
	def play_again?
				puts "Play again? (y/n)"
		if gets.chomp == "y"
			game = Hangman.new
			game.play
		else
			exit
		end
	end
	
end

game = Hangman.new
game.play