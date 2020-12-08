class Ship
  attr_reader :name,
              :health,
              :length

  def initialize(name, length)
    @name = name
    @health = length
    @length = length
  end

  def sunk?
    @health == 0
  end

  def hit
    @health -= 1
  end
end
