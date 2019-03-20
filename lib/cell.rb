class Cell
  
  attr_reader :coordinate,
              :hit,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @hit = false
    @ship = nil
  end

  def empty?
    @ship == nil ? true : false
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @hit ? true : false
  end

  def fire_upon
    @hit = true

    if @ship
      @ship.hit
    end
  end

  def render(show = false)

    if show && @ship && !@hit
      return "S"
    else
      return "~"
    end

    if fired_upon? == false
      return "."
    end

    if @hit && @ship == nil
      return "M"
    end

    if @hit && @ship.sunk?
      return "X"
    else
      return "H"
    end
  end

end