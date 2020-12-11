require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'

class BoardTest < Minitest::Test
  def setup
    @board      = Board.new
    @cruiser    = Ship.new("Cruiser", 3)
    @submarine  = Ship.new("Submarine", 2)
    @ship_array = [@cruiser, @submarine]
    @player     = Player.new(@board, @ship_array)
  end

  def test_it_exists_with_attributes
    assert_instance_of Player, @player
    assert_equal @ship_array, @player.ship_array
  end

  def test_player_can_place_ships
    assert_equal ["B1", "C1", "D1"], @player.place_ships(@cruiser, ["B1", "C1", "D1"])
    assert_equal "Cannot Place Ship", @player.place_ships(@cruiser, ["A1", "C1", "D1"])
  end
end
