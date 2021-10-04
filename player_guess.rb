require_relative 'display'

# Game logic for player guesser.
class PlayerGuess
  include Display

  def initialize
    @attempts = 12
    @answer = [1,2,3,4]
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
    input = gets.chomp.split('').map! { |str| str.to_i }

    until valid_input?(input)
      @display.invalid_input
      input = gets.chomp.split('').map! { |str| str.to_i }
    end

    @guess = input
    draw_guess(@guess, KeyPegs.new.generate(@guess, @answer))
  end

  def valid_input?(input)
    input.all? { |i| i.between?(1,6) } && input.size == 4
  end

  def won?
    @guess.code_pegs == @answer.code_pegs
  end
end