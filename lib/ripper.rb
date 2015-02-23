require 'pry'
require './lib/document'

class Ripper
  def parse_line(data)
    data.downcase.scan(/[A-Za-z]+/)
  end

  def parse_file(target)
    file = File.open(target)
    doc = Document.new
    file.each_line do |line|
      content = line.strip
      if content.length > 1
        doc.add_words(parse_line(content))
      end
    end
    doc
  end
end
