require 'pry'

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

class Document
  attr_reader :lines

  def initialize
    @lines = []
  end

  def line_count
    lines.count
  end

  def line(number)
    lines.at(number)
  end

  def add_words(set)
    lines.push(set)
  end
end
