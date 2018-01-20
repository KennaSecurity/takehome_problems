# frozen_string_literal: true

require_relative 'scoring/languages'

class Scoring
  attr_accessor :language

  def scoring_table
    Languages.scoring_table_for(language)
  end

  def initialize(language = :english)
    @language = language
  end

  def score_letter(letter)
    scoring_table
      .select { |k| k.include? letter }
      .first.last
  end
end
