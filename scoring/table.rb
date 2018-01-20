require_relative 'languages'

class Scoring
  # knows about the language scoring tables
  class Table
    attr_reader :table

    def self.for(language)
      new(language)
    end

    def initialize(language)
      @table = Languages.scoring_table_for(language)
    end

    def score(letter)
      table.find do |k,v|
        k.include? letter
      end&.last || 0
    end
  end
end
