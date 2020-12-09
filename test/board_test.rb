require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_it_exists_with_attributes
    assert_instance_of Board, @board

    assert_equal 16, @board.cells.length
  end
end