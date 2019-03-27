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
  def initialize(language == :english)
    @language = language
  end

  #simplified method by using constants, added an error message for wrong input
  #too repetitive -> find the language input in our constant set??
  def score_letter(letter)
    if @language == :english 
      ENGLISH.map do |point, l| 
        if l.include?(letter)
          return point
        else
          0
        end
      end

    elsif @language == :spanish
      SPANISH.map do |point, l| 
        if l.include?(letter)
          return point
        else
          0
        end

    else
      return "We do not have this language available yet"  
    end
  end
end
