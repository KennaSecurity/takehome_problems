# frozen_string_literal: true

class Scoring
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

=begin 

Business Logic:
  * New language feature needs to work without changing the way the method is called!
  - INPUT: Letter, optionally a language name
  - OUTPUT: Integer for the score of that letter, 0 if invalid
  - add initialize method with an instance variable for what language to be used 
  - default value should be current language (English) with option for other languages 
    - If we're already selling in Canada, there should be a French version! (Stretch goal)
  - opportunities for improvement: cypher hash?

TESTS:
  - add tests for letters from each category for the new language
  - add test for invalid input for the new language


Valid / invalid input concerns:
  - What should the response be for invalid letter input, such as words or numbers?
  - Can it be assumed that the language name will be passed in with a consistent format? I.E. spelling, capitalization? 
  - Can it be assumed that there are no security risks from input?

Edge cases:
  - Are letters reliably going to come in uppercase?

Refactoring:
  - cypher hash for each language, set on initialization
  - why do some lines have 'return' and others don't?
  - separation of concerns:  should another method first check if the input is in the current alphabet and upcase it?

Performance:
  - checking arrays for inclusion vs key/value lookup. I suspect the latter is faster (especially for letters like Q and Z) but can do tests to confirm 


=end 
