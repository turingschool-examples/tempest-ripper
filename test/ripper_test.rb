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

  def test_parsing_removes_underscores
    ripper = Ripper.new
    words = ripper.parse_line("My spirits_, _as in a dream_.")
    assert words.include?("spirits")
    refute words.include?("spirits_")
    assert words.include?("dream")
    refute words.include?("dream_.")
  end

  def test_parsing_a_file
    ripper = Ripper.new
    document = ripper.parse_file('./test/fixtures/micro_tempest.txt')
    assert_equal 5, document.line_count
  end

  def test_parsing_a_file_has_data_in_each_line
    ripper = Ripper.new
    document = ripper.parse_file('./test/fixtures/micro_tempest.txt')
    words = document.line(4)
    assert_equal 7, words.count
    assert words.include?("boatswain")
  end

  # THE TEMPEST.
  #
  # ACT I.
  #
  # SCENE I. _On a ship at sea: a tempestuous noise of thunder
  # and lightning heard._
  #
  # _Enter _a Ship-Master_ and _a Boatswain_._
  #
end
