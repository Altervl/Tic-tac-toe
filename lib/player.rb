# frozen_string_literal: true

# Class for adding players to a Tic-tac-toe game
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def make_a_move
    gets.chomp
  end
end
