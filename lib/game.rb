# frozen_string_literal: true

require_relative 'player'

# Main class for a Tic-tac-toe game
class Game
  def initialize(side)
    @board = Array.new(side) { Array.new(side, ' ') } # new array per row instead of a reference
    @player_x = Player.new('X')
    @player_o = Player.new('O')
  end

  # Game loop method
  def play
    round = 1

    loop do
      puts "-------\nRound #{round}\n-------"
      display_board

      puts "Player #{player_x.name}"
      ask_move(player_x)
      display_board
      break if winner?

      puts "Player #{player_o.name}"
      ask_move(player_o)
      display_board
      break if winner?

      round += 1
    end
  end

  private

  attr_accessor :board
  attr_reader :player_x, :player_o

  # Method for displaying state of the game
  def display_board
    board.each_with_index do |row, index|
      # Set and print a delimeter only after first and second rows
      delimeter = ('—   ' * board.size).chomp # remove trailing spaces
      puts delimeter if index.positive?
      puts row.join(' | ')
    end
  end

  def ask_move(player)
    puts "Make your move (enter a digit 1-#{board.size**2}):"

    loop do
      break unless register_move(player, player.make_move(board.flatten.size)).include? 'Error'

      puts 'Cell is occupied'
    end
  end

  # Method for marking a cell by a player
  def register_move(player, move)
    row = move / board.size
    col = move % board.size
    return 'Error' unless board[row][col] == ' '

    board[row][col] = player.name
  end

  def winner?
    result = track_winner

    puts result if result == 'Draw'
    puts "Player #{result} wins" if %w[X O].include? result

    result
  end

  # Winner tracking methods #

  def track_winner
    return 'Draw' unless board.flatten.include? ' '

    r = check_rows
    c = check_cols
    d = check_diagonals

    # return the winner if there is one
    [r, c, d].find { |i| %w[X O].include?(i) }
  end

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
