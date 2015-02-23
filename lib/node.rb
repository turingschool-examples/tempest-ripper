class Node
  attr_reader :word, :line_numbers, :left, :right

  def initialize(new_word, first_line_number)
    @word = new_word
    @line_numbers = [first_line_number]
  end

  def find(target)
    if word == target
      line_numbers
    elsif (target < word) && left
      left.find(target)
    elsif (target > word) && right
      right.find(target)
    else
      []
    end
  end

  def insert(new_word, line_number)
    if word == new_word
      line_numbers << line_number
    elsif new_word < word
      # word is less than this word
      if left
        left.insert(new_word, line_number)
      else
        @left = Node.new(new_word, line_number)
      end
    else
      # word is greater than this word
      if right
        right.insert(new_word, line_number)
      else
        @right = Node.new(new_word, line_number)
      end
    end
  end
end
