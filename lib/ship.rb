class Ship
  
  attr_reader :name,
              :length,
              :health

  def initialize(name, length)
    @health = length
    @length = length
    @name = name
  end

  def hit
    @health -= 1;
  end

  def sunk?
    @health > 0 ? false : true
  end
end