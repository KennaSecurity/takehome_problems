# frozen_string_literal: true
require_relative('scroble_library.rb')

class Scoring 
  
  def initialize(language)
    @language = language 
  end
  
  def score_letter(letter) 
    ScrobleLibrary.get_score(@language.downcase, letter.upcase) # case insensitive
  end   
  
end    
