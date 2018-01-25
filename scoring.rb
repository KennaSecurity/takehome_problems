# frozen_string_literal: true

class Scoring
  def score_letter(letter)
    return 1 if %w[A E I O U L N R S T].include?(letter)
    return 2 if %w[D G].include?(letter)
    return 3 if %w[B C M P].include?(letter)
    return 4 if %w[F H V W Y].include?(letter)
    return 5 if %w[K].include?(letter)
    return 8 if %w[J X].include?(letter)
    return 10 if %w[Q Z].include?(letter)
    return 0
  end
end
