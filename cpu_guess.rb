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
    input_code
    @answer = gets.chomp.split('').map! { |str| str.to_i }

    until valid_input?(@answer)
      invalid_input
      @answer = gets.chomp.split('').map! { |str| str.to_i }
    end

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
    @guess = cpu_ai

    draw_result(@guess, KeyPegs.new.generate(@guess.dup, @answer.dup))
  end

  def cpu_ai
    sleep(1)
    [@num_gen.rand(1..6),@num_gen.rand(1..6),
      @num_gen.rand(1..6),@num_gen.rand(1..6)]
  end

  def valid_input?(input)
    input.all? { |i| i.between?(1,6) } && input.size == 4
  end

  def won?
    @guess == @answer
  end
end