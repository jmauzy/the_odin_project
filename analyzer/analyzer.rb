text = File.open("oliver.txt")
line_count = text.count
text = File.readlines("oliver.txt").join
char_count = text.size
no_space = text.gsub(/\s/, '').size
word_count = text.split.length
sentence_count = text.split(/\.|\?|\!/).length
para_count = text.split(/\n\n/).length
puts "#{line_count}	Lines"
puts "#{char_count}	Characters"
puts "#{no_space}	Characters (without spaces)"
puts "#{word_count}	Words"
puts "#{sentence_count}	Sentences"
puts "#{para_count}	Paragraphs"
puts "#{word_count / sentence_count}	Words Per Sentence"
puts "#{sentence_count / para_count}	Sentences Per Paragraph"