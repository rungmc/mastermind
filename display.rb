# Manages the display output.
class Display
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

  def draw_guess(guess, pegs)
    puts guess.code_pegs, pegs
  end

  def victory
    puts 'Congratulations! You guessed the code!'
  end

  def defeat
    puts 'You failed to guess the code!'
  end
end
