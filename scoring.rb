# frozen_string_literal: true

class Scoring

  def initialize(language = :english)
    if language
      @language = language
    end
  end

  def score_letter(letter)
    #common letter-scores extracted
    return 1 if %w[A E I O U L N R S T].include?(letter)
    return 2 if %w[D G].include?(letter)
    return 3 if %w[B M P].include?(letter)
    return 4 if %w[F H V Y].include?(letter)
    return 8 if %w[X].include?(letter)
    return 10 if %w[Z].include?(letter)

    #language specific letter-scores
    if @language == :english
      return 3 if %w[C].include?(letter)
      return 4 if %w[W].include?(letter)
      return 5 if %w[K].include?(letter)
      return 8 if %w[J].include?(letter)
      return 10 if %w[Q].include?(letter)
    elsif @language == :spanish
      return 2 if %w[C].include?(letter)
      return 6 if %w[J].include?(letter)
      return 8 if %w[K LL Ñ Q RR W].include?(letter)
    end
    return 0
  end
end
