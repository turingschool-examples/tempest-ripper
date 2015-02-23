require 'minitest/autorun'
require 'minitest/pride'
require './lib/document'

class DocumentTest < Minitest::Test
  def test_it_enumerates_with_line_numbers
    skip
    doc = Document.new
    doc.add %w(what light through yonder)
    doc.add %w(window breaks)
    doc.add %w(it is the east)
    doc.add %w(and juliet is the sun)
  end
end
