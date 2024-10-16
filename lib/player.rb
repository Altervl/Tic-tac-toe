# frozen_string_literal: true

# Class for adding players to a Tic-tac-toe game
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def make_a_move
    puts 'Make your move (enter a couple of digits (1-3) separated by a space):'
    gets.chomp
  end
end
