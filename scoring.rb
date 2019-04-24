# frozen_string_literal: true

class Scoring
  SCORING_HASH = {
    :english => {
      "A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1,
      "N" => 1, "R" => 1, "S" => 1, "T" => 1, "D" => 2, "G" => 2,
      "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4,
      "V" => 4, "W" => 4, "Y" => 4, "K" => 5, "J" => 8, "X" => 8,
      "Q" => 10, "Z" => 10
    },
    :spanish => {
      "A" => 1, "E" => 1, "O" => 1, "S" => 1, "I" => 1, "U" => 1,
      "N" => 1, "L" => 1, "R" => 1, "T" => 1, "C" => 2, "D" => 2,
      "G" => 2, "B" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4,
      "V" => 4, "Y" => 4, "J" => 6, "K" => 8, "LL" => 8, "Ñ" => 8,
      "Q" => 8, "RR" => 8, "W" => 8, "X" => 8, "Z" => 10
    }
  }

  def initialize(language = :english)
    @language = language # set language setting (defaults to english)
  end

  def score_letter(letter)
    SCORING_HASH[@language][letter]
  end
end
