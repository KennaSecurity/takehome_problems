# frozen_string_literal: true

class Scoring
  POINT_CALCULATORS = ['spanish_points', 'english_points']
  POINT_CALCULATORS.each { |calculator| require_relative calculator }
  attr_reader :language

  def initialize(language = :english)
    @language = language
  end

  def score_letter(letter)
    case language
    when :english
      EnglishPoints.lookup(letter)
    when :spanish
      SpanishPoints.lookup(letter)
    end
  end
end
