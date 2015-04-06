class Tictactoe
	@@win = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
	attr_accessor :p1_name, :p2_name
	def initialize
		@game_board = Board.new
		@p1 = Player.new("X")
		@p2 = Player.new("O")
		@current_turn = 0
		@playing = true
		@winner = nil
	end
	
	class Board
		attr_accessor :state
		def initialize
		@state = Array.new(9, " ")
		end
	end
	
	def play
		system "clear"
		get_names
		draw_board
		game_loop
	end
	
	def get_names
		puts "Enter name for Player 1:"
		@p1.name = gets.chomp
		puts "Hello, #{@p1.name}! you will be '#{@p1.sym}'"
		puts
		puts "Enter name for Player 2:"
		@p2.name = gets.chomp
		puts "Hello, #{@p2.name}! you will be '#{@p2.sym}'"
		puts
	end
	
	def draw_board
		puts "		-------------"
		puts "		| #{@game_board.state[0]} | #{@game_board.state[1]} | #{@game_board.state[2]} |"
		puts "		-------------"
		puts "		| #{@game_board.state[3]} | #{@game_board.state[4]} | #{@game_board.state[5]} |"
		puts "		-------------"
		puts "		| #{@game_board.state[6]} | #{@game_board.state[7]} | #{@game_board.state[8]} |"
		puts "		-------------"
		puts
	end
	
	class Player
		attr_accessor :name, :sym
		def initialize(sym)
			@name = nil
			@sym = sym
		end
	end
	
	def game_loop
		while @playing && @current_turn < 9
				next_turn
				system "clear"
				draw_board
		end
		game_over
	end
	
	def next_turn
		@current_turn += 1
		@current_turn.odd? ? turn(@p1) : turn(@p2)
	end
	
	def turn(player)
		puts "	#{player.name}: Choose a square (1-9)"
		move = gets.chomp.to_i - 1
		if valid(move)
			@game_board.state[move] = player.sym
		else
			try_again(player)
		end
		victory?(player)
	end
	
	def valid(move)
		move.between?(0,8) && @game_board.state[move] == " "
	end
	
	def try_again(player)
		system "clear"
		draw_board
		puts "	Invalid entry. Please try again."
		turn(player)
	end
			
	def victory?(player)
		@@win.each do |wins|
			if wins.all? { |i| @game_board.state[i] == player.sym }
				@winner = player.name
				@playing = false
			end
		end
	end
	
	def game_over
		system "clear"
		draw_board
		if @winner
			puts "#{@winner} wins! Play again? (y/n)"
		else
			puts "It's a tie! Play again? (y/n)"
		end
		if gets.chomp == "y"
			game = Tictactoe.new
			game.play
		else
			exit
		end
	end		

end

game = Tictactoe.new
game.play