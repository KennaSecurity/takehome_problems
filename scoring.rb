# frozen_string_literal: true

class Scoring
  attr_reader :language

  def initialize(language = :english)
    @language = language
  end

  def score_letter(letter)
    case language
    when :english
      if %w[A E I O U L N R S T].include?(letter)
        1
      elsif %w[D G].include?(letter)
        2
      elsif %w[B C M P].include?(letter)
        3
      elsif %w[F H V W Y].include?(letter)
        4
      elsif %w[K].include?(letter)
        5
      elsif %w[J X].include?(letter)
        8
      elsif %w[Q Z].include?(letter)
        10
      else
        0
      end
    when :spanish
      if %w[A E O S I U N L R T].include?(letter)
        1
      elsif %w[C D G].include?(letter)
        2
      elsif %w[B M P].include?(letter)
        3
      elsif %w[F H V Y].include?(letter)
        4
      elsif %w[J].include?(letter)
        6
      elsif %w[K LL Ñ Q RR W X].include?(letter)
        8
      elsif %w[Z].include?(letter)
        10
      else
        0
      end
    end
  end
end
