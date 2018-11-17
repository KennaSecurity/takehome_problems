# frozen_string_literal: true

class Scoring
  # constant variables
  ENGLISH = {1 => ["E", "A", "I", "O", "N", "R", "T", "L", "S", "U"],
    2 => ["D", "G"],
    3 => ["B", "C", "M", "P"],
    4 => ["F", "H", "V", "W", "Y"],
    5 => ["K"],
    8 => ["J", "X"],
    10 => ["Q", "Z"]
    }

  SPANISH = {1 => ["A", "E", "O", "S", "I", "U", "N", "L", "R", "T"],
     2 => ["C", "D", "G"],
     3 => ["B", "M", "P"],
     4 => ["F", "H", "V", "Y"],
     6 => ["J"],
     8 => ["K", "LL", "Ñ", "Q", "RR", "W", "X"],
     10 => ["Z"]
     }

  # language stored in initialize

  def score_letter(letter)
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
  end

end



#     Scoring.new.score_letter('C') # returns 3

#     language = :spanish
#     Scoring.new(language).score_letter('C') # returns 2

# English-language sets sold within Canada use:

#     1 point: E, A, I, O, N, R, T, L, S, U
#     2 points: D, G
#     3 points: B, C, M, P
#     4 points: F, H, V, W, Y
#     5 points: K
#     8 points: J, X
#     10 points: Q, Z

# Spanish-language sets sold within Mexico (known as Scrobly – Edición en Español) will use:

#     1 point: A, E, O, S, I, U, N, L, R, T
#     2 points: C, D, G
#     3 points: B, M, P
#     4 points: F, H, V, Y
#     6 points: J
#     8 points: K, LL, Ñ, Q, RR, W, X
#     10 points: Z
