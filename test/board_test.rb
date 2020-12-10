require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
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

  def test_valid_placement_for_length_of_ship
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_it_can_split_letters
    assert_equal [65, 65, 65], @board.split_letters(["A1", "A2", "A4"])
  end

  def test_it_can_split_numbers
    assert_equal [1, 2, 4], @board.split_numbers(["A1", "A2", "A4"])
  end

  def test_letters_consecutive
    assert_equal true, @board.consecutive_letters?(["A1", "B2", "C4"])
    assert_equal false, @board.consecutive_letters?(["A1", "C2", "C4"])
  end

  def test_numbers_consecutive
    assert_equal false, @board.consecutive_numbers?(["A1", "B2", "C4"])
    assert_equal true, @board.consecutive_numbers?(["A1", "B2", "C3"])
  end

  def test_numbers_and_letters_consecutive
    assert_equal false, @board.consecutive_letters_and_numbers?(["A1", "A2", "A4"])
    assert_equal true, @board.consecutive_letters_and_numbers?(["A1", "A2", "A3"])

    assert_equal false, @board.consecutive_letters_and_numbers?(["A1", "C1"])
    assert_equal true, @board.consecutive_letters_and_numbers?(["A1", "B1"])
  end

  def test_valid_placement_must_be_consecutive
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])

    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])

    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])

    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])

    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])

    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_placement_cannot_be_diagonal
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C3", "D4"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "B1"])
  end

  def test_placed_ships_occupy_cells
    @board.place(@cruiser, ["A1", "A2", "A3"])

    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    assert_equal cell_1.ship, @cruiser
    assert_equal cell_2.ship, @cruiser
    assert_equal cell_3.ship, @cruiser

    assert_equal cell_1.ship, cell_3.ship
  end

  def test_ships_dont_overlap
    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
  end
end
