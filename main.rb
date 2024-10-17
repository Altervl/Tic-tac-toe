# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/player'

# Create two players and a game with 3 x 3 board size
player1 = Player.new('X')
player2 = Player.new('O')
game = Game.new(3, player1, player2)
round = 1

# Game loop
loop do
  puts "--------------\nRound #{round}\n--------------"
  game.display

  puts "--------------\nPlayer 1\n--------------"
  loop do
    break unless game.register_move(player1, player1.make_a_move).include? 'Error'

    puts 'Cell is occupied'
  end

  game.display

  result = game.track_winner
  if result == 'Draw'
    puts result
    break
  elsif result == 'X'
    puts 'Player 1 (X) wins'
    break
  end

  puts "--------------\nPlayer 2\n--------------"

  loop do
    break unless game.register_move(player2, player2.make_a_move).include? 'Error'

    puts 'Cell is occupied'
  end

  game.display

  result = game.track_winner
  if result == 'Draw'
    puts result
    break
  elsif result == 'O'
    puts 'Player 2 (O) wins'
    break
  end

  round += 1
end
