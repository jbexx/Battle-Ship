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
      if first.ord != second.ord - 1
        return false
      end
    end
    return true
  end

  def valid_cons_numbers?(numbers)
    numbers.each_cons(2) do |first, second|
      if first.to_i != second.to_i - 1
        return false
      end
    end
    return true
  end

  def cell_has_ship?(coords)
    coords.each do |coord|
      if @cells[coord].ship != nil
        return true
      end
      return false
    end
  end

  def seperate_numbers_letters(coords)
    letters = []
    numbers = []

    coords.each do |coord|
      split_coords = coord.split(//)
      letters << split_coords[0]
      numbers << split_coords[1]
    end

    coord_data = Hash.new

    coord_data['letters'] = letters
    coord_data['numbers'] = numbers

    return coord_data
  end

  def valid_placement?(ship, coords)
    if coords.count != ship.length
      return false
    end

    if cell_has_ship?(coords)
      return false
    end

    coord_data = seperate_numbers_letters(coords)

    letters = coord_data['letters']
    numbers = coord_data['numbers']

    # coords.each do |coord|
    #   split_coords = coord.split(//)
    #   letters << split_coords[0]
    #   numbers << split_coords[1]
    # end

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
    if !valid_placement?(ship,coords)
      return "Ivalid Placement"
    end

    coords.each do |coord|
      @cells[coord].place_ship(ship)
    end
  end

  def render(show = false)
    coord_data = seperate_numbers_letters(@cells.keys)
    letters = coord_data['letters']
    single_numbers = coord_data['numbers'].uniq
    render_string = " #{single_numbers.join(' ')}"

    @cells.keys.each_with_index { |coord, i|
      if letters[i] != letters[i - 1]
        render_string.concat(" \n#{letters[i]}")
      end
      render_string.concat(" #{@cells[coord].render(show)}")
    }
     
    render_string
  end

end