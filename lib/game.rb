# frozen_string_literal: true

# Main class for a Tic-tac-toe game
class Game
  def initialize(side, player1, player2)
    @board = Array.new(side) { Array.new(side, ' ') } # new array per row instead of reference
    @player_x = player1
    @player_o = player2
    @winner = nil
  end

  # Method for marking a cell by a player
  def register_move(player, move)
    r, c = move.split(' ').map { |i| i.to_i - 1 }
    return 'Error. The cell is marked already.' unless board[r][c] == ' '

    board[r][c] = player.name
  end

  # Method for displaying state of the game
  def display
    board.each_with_index do |row, index|
      # Print delimeter only after first and second rows
      puts '—   —   —' if index.positive?
      puts row.join(' | ')
    end
  end

  # Method for winner tracking
  def track_winner
    return 'Draw' unless board.flatten.include? ' '

    r = check_rows
    c = check_cols
    d = check_diagonals

    [r, c, d].find { |i| %w[X O].include?(i) }
  end

  private

  attr_accessor :board

  def check_rows
    board.each do |row|
      return row[0] if row.all?('X') || row.all?('O')
    end
  end

  def check_cols
    board.transpose.each do |col|
      return col[0] if col.all?('X') || col.all?('O')
    end
  end

  def check_diagonals
    n = board.size
    main_d = (0...n).map { |num| board[num][num] }
    secn_d = (0...n).map { |num| board[num][n - 1 - num] }

    [main_d, secn_d].each do |d|
      return d[1] if d.all?('X') || d.all?('O')
    end
  end
end
