
class Library
	attr_accessor :books

	def initialize(file = false)
		@file = file
		@books = @file ? YAML::load(File.read(@file)) : []
	end
	
	def get_books_in_category(category)
		@books.select { |book| book.category == category }
	end
	
	def add_book(book)
		@books.push(book)
	end
	
	def get_book(title)
		@books.select { |book| book.title == title }
	end
	
	def save(file = false)
		@file = file || @file || "library.yml"
		File.open @file, "w" do |f|
			f.write YAML::dump @books
		end
	end
end