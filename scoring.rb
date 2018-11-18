# frozen_string_literal: true

class Scoring

  ENGLISH = {
    1 => %w[A E I O U L N R S T],
    2 => %w[D G],
    3 => %w[B C M P],
    4 => %w[F H V W Y],
    5 => %w[K],
    8 => %w[J X],
    10 => %w[Q Z]
  }

  SPANISH = {
    1 => %w[A E O S I U N L R T],
    2 => %w[C D G],
    3 => %w[B M P],
    4 => %w[F H V Y],
    6 => %w[J],
    8 => %w[K LL Ñ Q RR W X],
    10 => %w[Z]
  }

  def initialize(language = nil)
    @score_key = handle_language(language)
  end

  def score_letter(letter)
    @score_key.each do |key, value|
      if value.include?(letter)
        return key
      end
    end
  end

  def handle_language(language)
    return SPANISH if language == :spanish
    ENGLISH
  end

end
