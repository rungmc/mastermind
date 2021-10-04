# Stores a particular sequence of code pegs.
class CodeSequence
  attr_reader :code_pegs

  def initialize(array = [1, 2, 3, 4])
    @code_pegs = array
  end
end
