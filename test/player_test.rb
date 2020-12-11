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
end
