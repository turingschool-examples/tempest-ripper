require './lib/node'

class Tree
  attr_reader :head

  def insert(word, line_number)
    if head.nil?
      @head = Node.new(word, line_number)
    else
      head.insert(word, line_number)
    end
  end

  def find(word)
    return [] unless head
    head.find(word)
  end
end
