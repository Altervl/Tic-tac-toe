# frozen_string_literal: true

# Class for adding players to a Tic-tac-toe game
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def make_move(board_size)
    loop do
      input = gets.chomp.to_i

      break input - 1 if input.is_a?(Integer) && (1..board_size).include?(input)

      puts "Player #{name}: wrong input"
    end
  end
end
