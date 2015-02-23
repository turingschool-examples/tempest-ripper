require 'minitest/autorun'
require 'minitest/pride'
require './lib/ripper'

class RipperTest < Minitest::Test

  def test_it_parses_a_line_of_text
    ripper = Ripper.new
    words = ripper.parse_line("My spirits, as in a dream, are all bound up.")
    assert_equal 10, words.count
  end

  def test_parsing_downcases_words
    ripper = Ripper.new
    words = ripper.parse_line("My spirits, as in a dream, are all bound up.")
    assert words.include?("my")
    refute words.include?("My")
  end

  def test_parsing_removes_puncuation
    ripper = Ripper.new
    words = ripper.parse_line("My spirits, as in a dream, are all bound up.")
    assert words.include?("spirits")
    refute words.include?("spirits,")
    assert words.include?("up")
    refute words.include?("up.")
  end
end
