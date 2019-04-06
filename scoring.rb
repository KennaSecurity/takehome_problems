# frozen_string_literal: true

class Scoring
  attr_accessor :language

  #created constant hashes for each language option
  ENGLISH = {
    1 => %w[A E I O U L N R S T],
    2 => %w[D G],
    3 => %w[B C M P],
    4 => %w[F H V W Y],
    5 => %w[K],
    8 => %w[J X],
    10 => %w[Q Z]
  }

  SPANISH = {
    1 => %w[A E O S I U N L R T],
    2 => %w[C D G],
    3 => %w[B M P],
    4 => %w[F H V Y],
    6 => %w[J],
    8 => %w[K LL Ñ Q RR W X],
    10 => %w[Z]
  }

  #initialized language with a default value of :english
  def initialize(language = :english)
    @language = language
  end

  #used helper method to find version and make score_letter method simpler
  def find_version
    if @language == :english
      ENGLISH
    elsif @language == :spanish
      SPANISH
    end
  end

  #simplified method by refactoring with find_verison, added an error message for wrong input
  def score_letter(letter)
    if ver = find_version
      ver.map do |point, list| 
        if list.include?(letter.to_s.upcase)
          return point
        end
      end
      return 0
    else
      return "We do not have this language available yet"  
    end
  end

  def score_word(word)
    arr = word.split('')
    arr.inject(0) do |sum, letter|
      sum + score_letter(letter)
    end
  end
end
