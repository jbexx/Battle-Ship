require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_it_exists
    ship = Ship.new("Pony", 4)

    assert_instance_of Ship, ship
  end

  def test_it_has_a_name
    ship = Ship.new("Pony", 4)

    assert_equal "Pony", ship.name
  end

  def test_it_has_a_length
    ship = Ship.new("Pony", 4)

    assert_equal 4, ship.length
  end

  def test_it_has_health
    ship = Ship.new("Pony", 4)

    assert_equal 4, ship.health
  end

  def test_it_can_be_hit
    ship = Ship.new("Pony", 4)

    assert_equal 4, ship.health

    ship.hit
    
    assert_equal 3, ship.health    
  end

  def test_it_can_be_sunk
    ship = Ship.new("Pony", 4)

    assert_equal false, ship.sunk?
    
    ship.length.times do 
      ship.hit
    end

    assert_equal true, ship.sunk?
  end

end
