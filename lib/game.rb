class Game
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3) } # new array per row instead of reference
    @player_X = Player.new('X')
    @player_0 = Player.new('0')
    @winner = nil
  end

  def register_turn(player, cell)
    board[cell] = player.name
  end
end
