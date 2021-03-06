require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/ship'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_has_a_cells
    board = Board.new

    refute_empty board.cells
  end

  def test_cells_are_valid
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal false, board.valid_coordinate?("A11")
  end

  def test_ship_placement_is_valid_horizontally
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
  end

  def test_ship_placement_is_valid_vertically
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "B1"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "B1", "D1"])
    assert_equal true, board.valid_placement?(cruiser, ["A1", "B1", "C1"])
  end

  def test_ship_placement_is_not_valid_diagonaly
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
  end

  def test_ship_gets_placed
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    assert_nil nil, board.cells["A1"].ship

    board.place(cruiser, ["A1", "B1", "C1"])

    refute_nil board.cells["A1"].ship
  end

  def test_board_renders
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "B1", "C1"])

    board_string = " 1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . ."

    assert_equal board_string, board.render

    board_with_ship = " 1 2 3 4 \nA S . . . \nB S . . . \nC S . . . \nD . . . ."
    
    assert_equal board_with_ship, board.render(true)
  end

end
