require_relative 'display'

# A CLI version of the game MasterMind.
class Game
  include Display

  def play
    instructions
    PlayerGuess.new.play
  end

end