class User
  attr_reader :board

  def initialize
    @board = Board.new
  end
end