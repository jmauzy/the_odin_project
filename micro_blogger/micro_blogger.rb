require 'jumpstart_auth'

class MicroBlogger
	attr_reader :client
	
	def initialize
		puts "initializing MicroBlogger..."
		@client = JumpstartAuth.twitter
	end
	
	def run
	command = ""
		puts "Welcome to the JSL Twitter Client!"
		while command != "q"
			printf "Enter a command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			case command
				when 'q' then puts "Goodbye!"
				when 't' then tweet(parts[1..-1].join(" "))
				when 'dm' then dm(parts[1], parts[2..-1].join(" "))
				when 'spam' then spam_my_followers(parts[1..-1].join(" "))
				when 'elt' then everyones_last_tweet
				else
					puts "Sorry, I don't know how to #{command}."
			end
		end
	end
	
	def spam_my_followers(message)
		list = followers_list
		list.each do |f|
			dm(f, message)
		end
	end
		
	def followers_list
		screen_names = []
		@client.followers.each do |f|
			screen_names << @client.user(f).screen_name
		end
		screen_names
	end
	
	def tweet(message)
		if message.length <= 10
			@client.update(message)
		else
			puts "Messages can only be 140 characters long!"
		end
	end
	
	def dm(target, message)
		follower_names = @client.followers.collect { |f| @client.user(f).screen_name }
		puts "Trying to send #{target} this direct message: "
		puts message
		message = "d @#{target} #{message}"
		if follower_names.include?(target)
			tweet(message)
		else
			puts "Sorry that user is not following you"
		end
	end
	
	def everyones_last_tweet
		friends = @client.friends.collect { |f| @client.user(f) }
		friends.each do |f|
			puts "#{f.screen_name} said the following on #{f.status.created_at.strftime("%A, %b %d")}..."
			puts "#{f.status.text}"
		end
	end
end

blogger = MicroBlogger.new
blogger.run