# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/player'

# Create two players and a game with 3 x 3 board size
player1 = Player.new('X')
player2 = Player.new('O')
game = Game.new(3, player1, player2)

round = 1
loop do
  puts '--------------'
  puts "Round #{round}"
  puts '--------------'
  game.display

  puts '--------------'
  puts 'Player 1'
  puts '--------------'
  move1 = player1.make_a_move
  game.register_move(player1, move1)

  game.display

  result = game.track_winner
  if result == 'Draw'
    puts result
    break
  elsif result == 'X'
    puts 'Player 1 (X) wins'
    break
  end

  puts '--------------'
  puts 'Player 2'
  puts '--------------'
  move2 = player2.make_a_move
  game.register_move(player2, move2)

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
