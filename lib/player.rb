# frozen_string_literal: true

# Class for adding players to a Tic-tac-toe game
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def make_a_move
    puts 'Make your move (enter a digit 1-9):'

    loop do
      input = gets.chomp.to_i

      break input - 1 if input.is_a?(Integer) && (1..9).include?(input)

      puts "Player #{name}: wrong input"
    end
  end
end
