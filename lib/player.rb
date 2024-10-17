# frozen_string_literal: true

# Class for adding players to a Tic-tac-toe game
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def make_a_move
    puts 'Make your move (enter a digit 1-9):'
    gets.chomp.to_i - 1 # get index for gameboard array
  end
end
