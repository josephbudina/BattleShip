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
    @computer   = Computer.new
  end

  def test_it_exists_with_attributes
    assert_instance_of Computer, @computer

    assert_instance_of Board, @computer.board
  end

  def test_computer_can_place_ships
    assert_equal ["B1", "C1", "D1"], @computer.place_ships(@cruiser, ["B1", "C1", "D1"])
    assert_equal ["B1", "C1", "D1"], @computer.random_coordinates(@cruiser, 3)
  end
end
