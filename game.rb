require_relative 'display'

# A CLI version of the game MasterMind.
class Game
  include Display

  def play
    instructions
    mode = gets.chomp.to_i
    
    until mode.between?(1,2)
      puts "Selection error! Try again:"
      mode = gets.chomp.to_i
    end

    if mode == 1
      PlayerGuess.new.play
    elsif mode == 2
      CpuGuess.new.play
    end
  end

end