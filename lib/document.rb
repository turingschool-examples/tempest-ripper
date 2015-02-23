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

  def find_locations_for(word)
    results = []
    lines.each.with_index do |line, index|
      if line.include?(word)
        results << index
      end
    end
    results
  end
end
