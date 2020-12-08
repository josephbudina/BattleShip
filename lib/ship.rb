class Ship
  attr_reader :name,
              :health,
              :length

  def initialize(name, length)
    @name = name
    @health = 3
    @length = length
  end


end
