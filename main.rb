# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/player'

# Create two players and a game with 3 x 3 board size
player1 = Player.new('X')
player2 = Player.new('0')
game = Game.new(3, player1, player2)

winner = nil

unless winner
  # to do
end
