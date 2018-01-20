# frozen_string_literal: true

require_relative 'scoring/table'

# scoring gives the score for a scrobbly letter
class Scoring
  attr_reader :scoring_table

  def initialize(language = :english)
    @scoring_table = Table.for(language)
  end

  def score_letter(letter)
    scoring_table.score letter
  end
end
