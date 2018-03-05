# frozen_string_literal: true

class Scoring

  def initialize(language = nil)
    @language =  language
  end

  def score_letter(letter)
    if %w[A E O S I U N L R T].include?(letter)
        return 1
    end
    if @language.nil?
      if %w[D G].include?(letter)
        2
      elsif %w[B C M P].include?(letter)
        3
      elsif %w[F H V W Y].include?(letter)
        4
      elsif %w[K].include?(letter)
        5
      elsif %w[J X].include?(letter)
        8
      elsif %w[Q Z].include?(letter)
        10
      else
        0
      end
    elsif @language == :spanish
      if %w[C D G].include?(letter)
        2
      elsif %w[B M P].include?(letter)
        3
      elsif %w[F H V Y].include?(letter)
        4
      elsif %w[J].include?(letter)
        6
      elsif %w[K LL Ñ Q RR W X].include?(letter)
        8
      elsif %w[Z].include?(letter)
        10
      else
        0
      end
    else
      0  
    end  
  end
end

# language = :spanish
# Scoring.new(language).score_letter('C')
# Scoring.new(language).score_letter('E')

# Scoring.new.score_letter('C')
# Scoring.new.score_letter('A')