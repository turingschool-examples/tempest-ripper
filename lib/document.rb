require './lib/tree'

class Document
  attr_reader :lines, :words

  def initialize
    @lines = []
    @words = Tree.new
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
      words.insert(word, line_number)
    end
  end

  def find_locations_for(word)
    words.find(word)
  end
end
