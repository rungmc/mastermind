# Handles creation of key pegs.
class KeyPegs

  def initialize(pos_symbol = 'o', exact_symbol = 'O')
    @key_pegs = []
    @exact_symbol = exact_symbol
    @contains_symbol = pos_symbol
  end

  def generate(guess, answer)
    # Exact match.
    matched = []
    for i in 0..3
      if guess[i] == answer[i]
        matched.push(i)
        @key_pegs.push(@exact_symbol)
      end
    end
    matched.reverse_each do |i|
      answer.delete_at(i)
      guess.delete_at(i)
    end

    # Wrong pos match.
    guess.each do |peg|
      if answer.any?(peg)
        answer.delete_at(answer.index(peg))
        @key_pegs.push(@contains_symbol)
      end
    end

    @key_pegs
  end
end
