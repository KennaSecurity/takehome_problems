# frozen_string_literal: true

class Scoring
  attr_reader :language

  def initialize(language = :english)
    @language = language
  end

  def score_letter(letter)
    if language.downcase == :spanish
      return 1 if %w[A E O S I U N L R T].include?(letter)
      return 2 if %w[C D G].include?(letter)
      return 3 if %w[B M P].include?(letter)
      return 4 if %w[F H V Y].include?(letter)
      return 6 if %w[J].include?(letter)
      return 8 if %w[K LL Ñ Q RR W X].include?(letter)
      return 10 if %w[Z].include?(letter)
      0
    elsif language.downcase == :english
      return 1 if %w[A E I O U L N R S T].include?(letter)
      return 2 if %w[D G].include?(letter)
      return 3 if %w[B C M P].include?(letter)
      return 4 if %w[F H V W Y].include?(letter)
      return 5 if %w[K].include?(letter)
      return 8 if %w[J X].include?(letter)
      return 10 if %w[Q Z].include?(letter)
      0
    else
      puts 'Please enter a valid language'
    end
  end
end
