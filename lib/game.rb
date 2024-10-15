# frozen_string_literal: true

require_relative 'player'

# Main class for a Tic-tac-toe game
class Game
  attr_accessor :board

  def initialize(side, player1, player2)
    @board = Array.new(side) { Array.new(side) } # new array per row instead of reference
    @player_x = player1
    @player_o = player2
    @winner = nil
  end

  # Method for marking a cell by a player
  def register_move(player, cell)
    board[cell] = player.name
    track_winner
  end

  # Method for winner tracking
  def track_winner
    check_rows
    check_cols
    check_diagonals
  end

  private

  def check_rows
    board.each do |row|
      return row[0] if row.all?('X') || row.all?('0')
    end
  end

  def check_cols
    board.transpose.each do |col|
      return col[0] if col.all?('X') || col.all?('0')
    end
  end

  def check_diagonals
    n = board.size
    main_d = (0...n).map { |num| board[num][num] }
    sec_d = (0...n).map { |num| board[num][n - 1 - num] }

    [main_d, sec_d].each do |d|
      return d[1] if d.all?('X') || d.all?('0')
    end
  end
end
