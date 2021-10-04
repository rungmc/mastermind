# Handles creation of key pegs.
class KeyPegs
  attr_reader :exact_symbol, :key_pegs

  def initialize(pos_symbol = 'o', exact_symbol = 'O')
    @key_pegs = []
    @exact_symbol = exact_symbol
    @contains_symbol = pos_symbol
  end

  def generate(guess, answer)
    exact_match(guess, answer)
    contains(guess, answer)
    @key_pegs
  end

  private

  def exact_match(guess, answer)
    matched = []
    for i in 0..3
      if guess[i] == answer[i]
        matched += answer[i]
        @key_pegs += @exact_symbol
      end
    end
    matched.each { |i| answer.delete(i) }
    nil
  end

  def contains(guess, answer)
    guess.each do |peg|
      if answer.any?(peg)
        answer.delete_at(answer.index(peg))
        @key_pegs += @contains_symbol
      end
    end
    nil
  end
end
