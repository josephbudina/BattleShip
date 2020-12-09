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

  def test_it_can_validate_coordinates
    assert_equal true, @board.valid_coordinate?("A1")

    assert_equal true, @board.valid_coordinate?("D4")

    assert_equal false, @board.valid_coordinate?("A5")

    assert_equal false, @board.valid_coordinate?("E1")

    assert_equal false, @board.valid_coordinate?("A22")
  end
end