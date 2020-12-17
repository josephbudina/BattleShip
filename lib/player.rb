module Player
  def ships_health
    @ships.sum do |ship|
      ship.health
    end
  end
end
