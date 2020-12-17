require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'

class ComputerTest < Minitest::Test
  def setup
    @board      = Board.new
    @cruiser    = Ship.new("Cruiser", 3)
    @submarine  = Ship.new("Submarine", 2)
    @computer   = Computer.new(@board)
  end

  def test_it_exists_with_attributes
    assert_instance_of Computer, @computer

    assert_instance_of Board, @computer.board
  end

  def test_computer_can_place_ships
    assert_instance_of Array, @computer.place_ship(@cruiser)
  end

  def test_random_coords_are_valid
    @computer.place_ship(@cruiser)
    @computer.place_ship(@submarine)

    assert_equal 5, @computer.board.render(true).count("S")

    @computer.place_ship(@cruiser)
    @computer.place_ship(@submarine)

    assert_equal 10, @computer.board.render(true).count("S")
  end

  def test_it_applies_user_shot
    assert_equal true, @computer.apply_shot("A1")
    @computer.place_ship(@cruiser)
    @computer.apply_shot("A1")

    assert_equal true, @computer.board.cells["A1"].fired_upon?
    assert_equal "M", @computer.board.cells["A1"].render
  end

  def test_random_shots_are_valid
    assert_equal true, @board.valid_coordinate?(@computer.take_random_shot)

    assert_equal 15, @computer.available_coordinates.length
  end

  def test_it_sums_computer_health
    assert_equal 5, @computer.ships_health

    @computer.cruiser.hit

    assert_equal 4, @computer.ships_health
  end
end
