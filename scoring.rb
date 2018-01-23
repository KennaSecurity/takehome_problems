# frozen_string_literal: true

class Scoring

  def initialize(language=:english)
    @language = language
  end 


  def score_letter(letter)
    letter = format_input(letter)
    @scoring_cypher = self.choose_cypher
    @scoring_cypher.has_key?(letter) ? @scoring_cypher[letter] : 0   
  end
    

  def choose_cypher

    languages = {

      english:  {
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
      },
    
      spanish: {
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
      },
  
      french: {
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
      },
    }

    if languages.has_key?(@language)
      languages[@language]
    else
      languages[:english] 
    end  
  end 


  def sanitize_input(letter)
    unallowed_chars = /[\/\\:"<>'#{}]/
    letter = letter.to_s.gsub(unallowed_chars, '')
  end 

  def format_input(letter)
    letter = sanitize_input(letter)
    letter.upcase!
    letter.tr("ÁÉÍÓÚÀÂÄÇÉÈÊËÎÏÔÙÛÜ", "AEIOUAAACEEEEIIOUUU")
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
  - add tests for the new language
    - how many tests is too many? Could potentially check all English letters and then just letters in other languages with values that differ from English
  - add test for invalid input

Valid / invalid input concerns:
  - What should the response be for invalid letter input, such as words or numbers?
  - Can it be assumed that the language name will be passed in with a consistent format? i.e. spelling, capitalization, data type? 
  - Are letters reliably going to come in uppercase?

Edge cases:
  - For Spanish and French versions, the rules say it should ignore diacritical marks, so some way to normalize letters

Refactoring:
  - cypher hash for each language, set on initialization
  - why do some lines have 'return' and others don't?
  - separation of concerns:  should one method check for valid input while another upcases it?
  - more separation of concerns: does language justify its own Class? 

Performance:
  - checking arrays for inclusion of something vs key/value lookup. I suspect the latter is faster (especially for letters like Q and Z that are in the last elsif statement)
  - case statements vs if / else. Which has the advantage as you add lanuages? We gotta globalize Scrobly before those Scrabble posers can corner the market!!
    -hah! got rid of that potentially long if/else statement entirely by using symbols 

Security:
  - This would vary by use case, and this code is just a small snippet of a bigger program, but depending on how a user enters their word and whether that word was persisted in the database, there could be opportunities for SQL or script injection. 

=end 
