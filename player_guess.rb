require_relative 'display'
require 'pry-byebug'

# Game logic for player guesser.
class PlayerGuess
  include Display

  def initialize
    @attempts = 12
    num_gen = Random.new
    @answer = [num_gen.rand(1..6),num_gen.rand(1..6),
      num_gen.rand(1..6),num_gen.rand(1..6)]
    @guess = []
  end

  def play
    until @attempts.zero?
      game_loop
      break if won?
    end

    if won?
      victory
    else
      defeat
    end
  end

  private

  def game_loop
    attempts_remaining(@attempts)
    @attempts -= 1
    @guess = gets.chomp.split('').map! { |str| str.to_i }

    until valid_input?(@guess)
      invalid_input
      @guess = gets.chomp.split('').map! { |str| str.to_i }
    end

    draw_result(@guess, KeyPegs.new.generate(@guess.dup, @answer.dup))
  end

  def valid_input?(input)
    input.all? { |i| i.between?(1,6) } && input.size == 4
  end

  def won?
    @guess == @answer
  end
end