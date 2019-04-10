# frozen_string_literal: true
require_relative 'languages'

class Scoring
  attr_reader :point_table

  # Initializer, instantiating new objects with a language relevant point table
  def initialize(language = :english)
    @point_table = Language.new(language).get
  end

  # Score Letter, searches provided hash and returns found relevant value or 0 
  def score_letter(letter)
    table_entry = self.point_table.find {|k,v| k.include?(letter.upcase)}
    
    if table_entry != nil
      return table_entry[1]
    else
      return 0
    end
  end

end
