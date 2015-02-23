class Document
  attr_reader :lines, :words

  def initialize
    @lines = []
    @words = {}
  end

  def line_count
    lines.count
  end

  def line(number)
    lines.at(number)
  end

  def add_words(set)
    lines.push(set)
    line_number = lines.count - 1
    set.each do |word|
      words[word] = [] unless words[word]
      words[word].push(line_number)
    end
  end

  def find_locations_for(word)
    words[word]
  end
end
