# frozen_string_literal: true
require './score_key'

class Scoring
  def initialize(language = ENGLISH)
    @score_key = handle_language(language)
  end

  def handle_language(language)
    return SPANISH if language == :spanish
    language
  end

  def score_letter(letter)
    fixed_score[letter.upcase]
  end

  def fixed_score
    return @fixed_score if @fixed_score
    @fixed_score = {}
    @score_key.each do |score , letters|
      letters.each do |letter|
        @fixed_score[letter]= score
      end
    end
    @fixed_score
  end
end
