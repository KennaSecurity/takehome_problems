# frozen_string_literal: true
require 'pry'

class Scoring
  
  SPANISH_LETTERS = {"A" => 1, "B" => 3, "C" => 2, "D" => 2, "E" => 1,
                     "F" => 4, "G" => 2, "H" => 4 , "I" => 1 , "J" => 6,
                     "K" => 8, "L" => 1, "LL" => 8, "M" => 3, "N" => 1,
                     "Ñ" => 8, "O" => 1, "P" => 3, "Q" => 8,"R" => 1,
                     "RR" => 8, "S" => 1, "T" => 1, "U" => 1, "V" => 4,
                     "W" => 8, "X" => 8, "Y" => 4, "Z" => 10}
  
  ENGLISH_LETTERS = {"A" => 1, "B" => 3, "C" => 3, "D" => 2, "E" => 1,
                     "F" => 4, "G" => 2, "H" => 4, "I" => 1, "J" => 8,
                     "K" => 5, "L" => 1, "M" => 3, "N" => 1, "O" => 1,
                     "P" => 3, "Q" => 10, "R" => 1, "S" => 1, "T" => 1,
                     "U" => 1, "V" => 4, "W" => 4, "X" => 8, "Y" => 4,
                     "Z" => 10}
  
    def initialize(language)
      @language = language
    end
  
    def score_letter(letter)
      alphabet = get_letter_set(@language)
  
      alphabet[letter]
    end
  
    def get_letter_set(language)
      if language == :english
        ENGLISH_LETTERS
      else
        SPANISH_LETTERS
      end
    end
  
  end
