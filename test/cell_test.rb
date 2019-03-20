require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new("A6")

    assert_instance_of Cell, cell
  end

  def test_it_has_a_coordinate
    cell = Cell.new("A6")

    assert_equal "A6", cell.coordinate
  end

  def test_it_does_not_have_a_ship
    cell = Cell.new("A6")

    assert_nil nil, cell.ship
  end

  def test_it_is_empty
    cell = Cell.new("A6")

    assert_equal true, cell.empty?
  end

  def test_it_can_place_a_ship
    cell = Cell.new("A6")
    ship = Ship.new("Cruiser", 3)
    cell.place_ship(ship)

    assert_equal ship, cell.ship
  end

  def test_it_is_not_empty
    cell = Cell.new("A6")
    ship = Ship.new("Cruiser", 3)
    cell.place_ship(ship)
    
    assert_equal false, cell.empty?
  end

  def test_it_can_be_fired_upon
    cell = Cell.new("A6")

    assert_equal false, cell.fired_upon?

    cell.fire_upon

    assert_equal true, cell.fired_upon?
  end

  def test_when_fired_upon_ship_is_hit
    cell = Cell.new("A6")
    ship = Ship.new("Cruiser", 3)
    cell.place_ship(ship)

    assert_equal 3, cell.ship.health

    cell.fire_upon

    assert_equal 2, cell.ship.health
  end

  def test_will_render_if_not_fired_upon
    cell = Cell.new("A6")

    assert_equal ".", cell.render
  end

  def test_will_render_if_fired_upon_and_missed
    cell = Cell.new("A6")

    cell.fire_upon

    assert_equal "M", cell.render
  end

  def test_will_render_if_fired_upon_and_hit
    cell = Cell.new("A6")
    ship = Ship.new("Cruiser", 3)
    cell.place_ship(ship)

    cell.fire_upon

    assert_equal "H", cell.render
  end

  def test_will_render_if_fired_upon_hit_and_ship_sunk
    cell = Cell.new("A6")
    ship = Ship.new("Cruiser", 3)
    cell.place_ship(ship)

    ship.health.times do
      cell.fire_upon
    end

    assert_equal "X", cell.render
  end

  def test_will_render_if_asked_to_show
    cell = Cell.new("A6")
    ship = Ship.new("Cruiser", 3)
    cell.place_ship(ship)

    assert_equal "S", cell.render(true)
  end
end
