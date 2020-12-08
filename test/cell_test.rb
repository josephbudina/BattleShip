require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def setup
    @cell_b4 = Cell.new("B4")
    @cell_c3 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_cell_exists_with_attributes
    assert_instance_of Cell, @cell_b4
    assert_equal 'B4', @cell_b4.coordinate
    assert_nil @cell_b4.ship
  end

  def test_cell_b4_is_empty
    assert_equal true, @cell_b4.empty?
  end

  def test_place_ship_in_cell_b4
    @cell_b4.place_ship(@cruiser)

    assert_instance_of Ship, @cell_b4.ship

    assert_equal false, @cell_b4.empty?
  end

  def test_ship_is_fired_upon
    @cell_b4.place_ship(@cruiser)
    assert_equal false, @cell_b4.fired_upon?

    @cell_b4.fire_upon

    assert_equal 2, @cell_b4.ship.health
    assert_equal true, @cell_b4.fired_upon?
  end

  def test_it_can_render
    assert_equal ".", @cell_b4.render

    @cell_b4.fire_upon

    assert_equal "M", @cell_b4.render

    @cell_c3.place_ship(@cruiser)
    assert_equal ".", @cell_c3.render

    assert_equal "S", @cell_c3.render(true)
    @cell_c3.fire_upon

    assert_equal "H", @cell_c3.render

    assert_equal false, @cruiser.sunk?

    @cruiser.hit
    @cruiser.hit

    assert_equal true, @cruiser.sunk?

    assert_equal "X", @cell_c3.render
  end
end
