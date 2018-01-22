# frozen_string_literal: true

class Scoring

  def initialize(language=:english)
    @language = language
    self.choose_cypher
  end 
    
  def choose_cypher

    english_cypher = {
      "A" => 1,
      "B" => 3,
      "C" => 3,
      "D" => 2,
      "E" => 1,
      "F" => 4,
      "G" => 2,
      "H" => 4,
      "I" => 1,
      "J" => 8,
      "K" => 5,
      "L" => 1,
      "M" => 3,
      "N" => 1,
      "O" => 1,
      "P" => 3,
      "Q" => 10,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "U" => 1,
      "V" => 4,
      "W" => 4,
      "Y" => 4,
      "X" => 8,
      "Z" => 10,
      }
  
    spanish_cypher = {
      "A" =>  1,
      "B" =>  3,
      "C" =>  2,
      "D" =>  2,
      "E" =>  1,
      "F" =>  4,
      "G" =>  2,
      "H" =>  4,
      "I" =>  1,
      "J" =>  6,
      "K" =>  8,
      "L" =>  1,
      "LL" => 8,
      "M" =>  3,
      "N" =>  1,
      "Ñ" =>  8,
      "O" =>  1,
      "P" =>  3,
      "Q" =>  8,
      "R" =>  1,
      "RR" => 8,
      "S" =>  1,
      "T" =>  1,
      "U" =>  1,
      "V" =>  4,
      "W" =>  8,
      "X" =>  8,
      "Y" =>  4,
      "Z" =>  10,
      }

    french_cypher = {
      "A" => 1,
      "B" => 3,
      "C" => 3,
      "D" => 2,
      "E" => 1,
      "F" => 4,
      "G" => 2,
      "H" => 4,
      "I" => 1,
      "J" => 8,
      "K" => 10,
      "L" => 1,
      "M" => 2,
      "N" => 1,
      "O" => 1,
      "P" => 3,
      "Q" => 8,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "U" => 1,
      "V" => 4,
      "W" => 10,
      "X" => 10,
      "Y" => 10,
      "Z" => 10,
      }

    if @language == :spanish 
      @scoring_cypher = spanish_cypher
    elsif @language == :french
      @scoring_cypher = french_cypher
    else
      @scoring_cypher = english_cypher 
    end  
  end 


  def score_letter(letter)
    @scoring_cypher[letter] ? @scoring_cypher[letter] : 0   
  end

end

=begin 

Business Logic:
  * New language feature needs to work without changing the way the method is called!
  - INPUT: Letter as a string, optionally a language name as a symbol
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
  - more separation of concerns: does language justify its own Class? 

Performance:
  - checking arrays for inclusion vs key/value lookup. I suspect the latter is faster (especially for letters like Q and Z) but can do tests to confirm
  - case statements vs if / else. Which has the advantage as you add lanuages? We gotta globalize Scrobly before those Scrabble posers can corner the market!


=end 
