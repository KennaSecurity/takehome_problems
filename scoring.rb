# frozen_string_literal: true
class Scoring 

  def initialize(language)
    @language = language.downcase #case insensitive
  end
  
  def score_letter(letter)
    letter = letter.upcase #case insensitive 
    
    # English Metric Chosen  
    if @language.eql?(:english)
      if %w[A E I O U L N R S T].include?(letter)
        return 1
      elsif %w[D G].include?(letter)
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
      end # endif for english condition
      
    # Spanish Metric Chosen  
    elsif @language.eql?(:spanish)
      if %w[A E O S I U N L R T].include?(letter)
        1
      elsif %w[C D G].include?(letter)
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
      end # endif for spanish condition
      
    end  # endif for language logic/toggler
  end   # end score_letter method
end    # end Scoring class

# small test to ensure correctness before moving onto RSpec Testing
# language = :SPANISH
# scorer = Scoring.new(language).score_letter('R')
# puts scorer