# frozen_string_literal: true

class Scoring
  attr_reader :language

  def initialize(language='')
    @language = language
  end

  def score_letter(letter)
    if language.downcase == :spanish

    elsif language.downcase == ''
      if %w[A E I O U L N R S T].include?(letter)
        return 1
      elsif %w[D G].include?(letter)
        2
      elsif %w[B C M P].include?(letter)
        3
      elsif %w[F H V W Y].include?(letter)
        return 4
      elsif %w[K].include?(letter)
        5
      elsif %w[J X].include?(letter)
        8
      elsif %w[Q Z].include?(letter)
        10
      else
        0
      end
    else
      puts 'Please enter a valid language'
    end
  end
end
