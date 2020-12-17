require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/user'

class UserTest < Minitest::Test
  def setup
    @board      = Board.new
    @user       = User.new(@board)
    @cruiser    = Ship.new("Cruiser", 3)
    @submarine  = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of User, @user
    assert_instance_of Board, @user.board
  end

  def test_it_can_place_ships
    assert_equal ["A1", "B1", "C1"], @user.place_ships(@cruiser, ["A1", "B1", "C1"])
    assert_equal false, @user.place_ships(@cruiser, ["A1", "B1", "q1"])
  end

  def test_it_applies_enemy_shot
    assert_equal true, @user.apply_enemy_shot("A1")
    @user.place_ships(@cruiser, ["A1", "B1", "C1"])
    @user.apply_enemy_shot("A1")

    assert_equal true, @user.board.cells["A1"].fired_upon?
    assert_equal 2, @user.board.cells["A1"].ship.health
  end

  def test_user_ships_health_sums_health
    assert_equal 5, @user.ships_health
  end
end
