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
      table.select { |k| k.include? letter }.first.last
    end
  end
end
