# frozen_string_literal: true

class Scoring

  def initialize(language = :english)
    @language = language
  end

  def score_letter(letter)
    if %w[A E I O U L N R S T].include?(letter) && @language == :english
      return 1
    elsif %w[A E I O U L N R S T].include?(letter) && @language == :spanish
      return 1
    elsif %w[D G].include?(letter) && @language == :english
      2
    elsif %w[C D G].include?(letter) && @language == :spanish
      2
    elsif %w[B C M P].include?(letter) && @language == :english
      3
    elsif %w[B C M P].include?(letter) && @language == :spanish
      3
    elsif %w[F H V W Y].include?(letter) && @language == :english
      return 4
    elsif %w[F H V Y].include?(letter) && @language == :spanish
      return 4
    elsif %w[K].include?(letter) && @language == :english
      5
    elsif letter == 'J' && @language == :spanish
      6
    elsif %w[J X].include?(letter) && @language == :english
      8
    elsif %w[K LL Ñ Q RR W X].include?(letter) && @language == :spanish
      8
    elsif %w[Q Z].include?(letter)
      10
    else
      0
    end
  end
end
