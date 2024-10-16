# frozen_string_literal: true

# Class for adding players to a Tic-tac-toe game
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def make_a_move
    move = nil
    until move.is_a?(Integer) && (1..9).include?(move)
      puts 'Make your move (enter a number 1-9):'
      gets.chomp.to_i
    end
    move
  end
end
