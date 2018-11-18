# frozen_string_literal: true

class Scoring

  ENGLISH = {
    1 => ["E", "A", "I", "O", "N", "R", "T", "L", "S", "U"],
    2 => ["D", "G"],
    3 => ["B", "C", "M", "P"],
    4 => ["F", "H", "V", "W", "Y"],
    5 => ["K"],
    8 => ["J", "X"],
    10 => ["Q", "Z"]
  }

  SPANISH = {
    1 => ["A", "E", "O", "S", "I", "U", "N", "L", "R", "T"],
    2 => ["C", "D", "G"],
    3 => ["B", "M", "P"],
    4 => ["F", "H", "V", "Y"],
    6 => ["J"],
    8 => ["K", "LL", "Ñ", "Q", "RR", "W", "X"],
    10 => ["Z"]
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
