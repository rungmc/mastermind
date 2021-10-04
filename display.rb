# Manages the display output.
module Display
  def instructions
    puts <<-INSTRUCTIONS
\e[4m\e[1mMASTERMIND\e[0m\e[24m

This is a CLI-based implementation of the game Mastermind written in Ruby.
Mastermind is a code-breaking game where one player sets a code and the
other has a fixed number of attempts to correctly guess the sequence in
order.

After each guess, the codebreaker receives a visual indicator of how close
they were to a correct answer.  A 'o' indicates that one of your guessed
colors/numbers was in the code but not in the right location.  A 'O'
indicates that you nailed the exact location of a number/color in sequence.

Enter '1' to play as the codebreaker or '2' to be the codemaker:
    INSTRUCTIONS
  end

  def attempts_remaining(num)
    if num == 1
      puts 'This is your final guess, make it count!'
    else
      puts "You have #{num} guesses left!"
    end
  end

  def invalid_input
    puts 'Invalid guess! Try again (e.g., 1234):'
  end

  def draw_result(guess, pegs)
    result = ''
    guess.each { |num| result += num.to_s + ' ' }
    result += '     '
    pegs.each { |peg| result += peg.to_s }
    puts result
  end

  def victory
    puts 'Congratulations! You guessed the code!'
  end

  def defeat(answer)
    result = ''
    answer.each { |num| result += num.to_s + ' ' }
    puts "You failed to guess the code! The code was: #{result}"
  end
end
