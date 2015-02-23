require './lib/ripper'

ripper = Ripper.new
doc = ripper.parse_file("./test/fixtures/full_tempest.txt")

puts "The document has #{doc.line_count} lines"

%w(carthage sleepy thus).each do |word|
  puts "The word #{word} appears on lines #{doc.find_locations_for(word).inspect}"
end
