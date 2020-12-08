require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_cell_exists_with_attributes
    assert_instance_of Cell, @cell
    assert_equal 'B4', @cell.coordinate
    assert_nil @cell.ship
  end

  def test_cell_is_empty
    assert_equal true, @cell.empty?
  end

  def test_place_ship_in_cell
    @cell.place_ship(@cruiser)

    assert_instance_of Ship, @cell.ship

    assert_equal false, @cell.empty?
  end

  def test_ship_is_fired_upon
    @cell.place_ship(@cruiser)
    assert_equal false, @cell.fired_upon?

    @cell.fire_upon

    assert_equal 2, @cell.ship.health
    assert_equal true, @cell.fired_upon?
  end
end
