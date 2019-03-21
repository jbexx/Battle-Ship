require './lib/cell'

class Board

  attr_reader :cells

  def initialize
    @cells = Hash.new

    make_board
  end

  def make_board

    # letters = { 
    #   0 => "A",
    #   1 => "B",
    #   2 => "C",
    #   3 => "D"
    # }

    # 4.times do |i|
    #   @cells["A#{i + 1}"] = Cell.new{"A#{i + 1}"}
    #   @cells["B#{i + 1}"] = Cell.new{"B#{i + 1}"}
    #   @cells["C#{i + 1}"] = Cell.new{"C#{i + 1}"}
    #   @cells["D#{i + 1}"] = Cell.new{"D#{i + 1}"}
    # end

    @cells["A1"] = Cell.new("A1")
    @cells["A2"] = Cell.new("A2")
    @cells["A3"] = Cell.new("A3")
    @cells["A4"] = Cell.new("A4")
    @cells["B1"] = Cell.new("B1")
    @cells["B2"] = Cell.new("B2")
    @cells["B3"] = Cell.new("B3")
    @cells["B4"] = Cell.new("B4")
    @cells["C1"] = Cell.new("C1")
    @cells["C2"] = Cell.new("C2")
    @cells["C3"] = Cell.new("C3")
    @cells["C4"] = Cell.new("C4")
    @cells["D1"] = Cell.new("D1")
    @cells["D2"] = Cell.new("D2")
    @cells["D3"] = Cell.new("D3")
    @cells["D4"] = Cell.new("D4")

    # height.times do |i|
    #   width.times do |j|
    #     p [letters[i][j]]
    #   # @cells[[letters[i]j] = Cell.new(:A[i])
    #   end
    # end
  end

  def valid_coordinate?(coord)
    if @cells[coord]
      true
    else
      false
    end
  end

  def valid_cons_letters?(letters)
    letters.each_cons(2) do |first, second|
      p "First Letter.ord #{first.ord}"
      p "Second Letter.ord - 1:: #{second.ord - 1}"
      if first.ord != second.ord - 1
        return false
      end
    end
    return true
  end

  def valid_cons_numbers?(numbers)
    numbers.each_cons(2) do |first, second|
      p "First Number #{first.to_i}"
      p "Second Number - 1:: #{second.to_i - 1}"
      if first.to_i != second.to_i - 1
        return false
      end
    end
    return true
  end

  def valid_placement?(ship, coords)
    if coords.count != ship.length
      return false
    end

    letters = []
    numbers = []

    coords.each do |coord|
      split_coords = coord.split(//)
      letters << split_coords[0]
      numbers << split_coords[1]
    end

    if letters.all? { |x| x == letters[0] }
      if valid_cons_numbers?(numbers)
        return true
      end
    elsif numbers.all? { |x| x == numbers[0] }
      if valid_cons_letters?(letters)
        return true
      end
    else
      return false
    end
    return false
  end

  def place(ship, coords)
    if valid_placement?(ship,coords)

    end
  end

end