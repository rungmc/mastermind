# A CLI version of the game MasterMind.
class Game
  def initialize
    @attempts = 12
    @display = Display.new
    @answer = CodeSequence.new
    @guess = nil
    @pegs = nil
  end

  def play
    until @attempts.zero?
      game_loop
      break if won?
    end

    if won?
      @display.victory
    else
      @display.defeat
    end
  end

  private

  def game_loop
    @display.attempts_remaining(@attempts)
    @attempts -= 1
    input = gets.chomp.split('').map! { |str| str.to_i }

    until valid_input?(input)
      @display.invalid_input
      input = gets.chomp.split('').map! { |str| str.to_i }
    end

    @guess = CodeSequence.new(input)
    @pegs = KeyPegs.new.generate(@guess, @answer)
    @display.draw_guess(@guess, @pegs)
    nil
  end

  def valid_input?(input)
    input.all? { |i| i.between?(1,6) } && input.size == 4
  end

  def won?
    @guess.code_pegs == @answer.code_pegs
  end
end