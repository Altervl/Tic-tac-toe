class Game
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3) } # new array per row instead of reference
    @player_X = Player.new('X')
    @player_0 = Player.new('0')
    @winner = nil
  end

  # Method for marking a cell by a player
  def register_turn(player, cell)
    board[cell] = player.name
  end

  # Method for winner tracking
  def track_winner
    # Check for rows
    board.each do |row|
      return row[0] if row.all?('X') || row.all?('0')
    end

    # Check for cols
    board.transpose.each do |col|
      return col[0] if col.all?('X') || col.all?('0')
    end

    # Check for diagonals
    main_d = (0...board.size).map { |num| board[num][num] }
    sec_d = (0...board.size).map { |num| board[num][board.size - 1 - num] }

    [main_d, sec_d].each do |d|
      return d[1] if d.all?('X') || d.all?('0')
    end
  end
end
