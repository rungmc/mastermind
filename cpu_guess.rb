# Game logic for computer guesser.
class CpuGuess
  include Display

  def initialize
    @attempts = 12
    @num_gen = Random.new
    @answer = []
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
      defeat(@answer)
    end
  end

  private

  def game_loop
    attempts_remaining(@attempts)
    @attempts -= 1
    @guess = [num_gen.rand(1..6),num_gen.rand(1..6),
      num_gen.rand(1..6),num_gen.rand(1..6)]

    draw_result(@guess, KeyPegs.new.generate(@guess.dup, @answer.dup))
  end

  def won?
    @guess == @answer
  end
end