# frozen_string_literal: true
require 'rails'

# For the Hash variant of this function, I needed to include 'rails' to have access to the deep_copy function
# which allows adding entries to nested Hashes without them getting overwritten.

class ScoringHash

  def initialize(lang = :english)

    @language = lang.downcase   # Account for capitalization in language input
    @dict = Hash.new
    createDict()

  end

  # Added setLang function for if user doesn't want to re-initialize the class for every
  def setLang(lang)
    @language = lang.downcase
  end

  # Added getLang function to check what current language is
  def getLang()
    return @language
  end

  def createDict()

    # Create dictionary that includes english and spanish letter point values

    # English
    for i in %w[A E I O U L N R S T]
      @dict.deep_merge!(:english => {i => 1})
    end

    for i in %w[D G]
      @dict.deep_merge!(:english => {i => 2})
    end

    for i in %w[B C M P]
      @dict.deep_merge!(:english => {i => 3})
    end

    for i in %w[F H V W Y]
      @dict.deep_merge!(:english => {i => 4})
    end

    for i in %w[K]
      @dict.deep_merge!(:english => {i => 5})
    end

    for i in %w[J X]
      @dict.deep_merge!(:english => {i => 8})
    end

    for i in %w[Q Z]
      @dict.deep_merge!(:english => {i => 10})
    end

    #Spanish
    for i in %w[A E O S I U N L R T]
      @dict.deep_merge!(:spanish => {i => 1})
    end

    for i in %w[C D G]
      @dict.deep_merge!(:spanish => {i => 2})
    end

    for i in %w[B M P]
      @dict.deep_merge!(:spanish => {i => 3})
    end

    for i in %w[F H V Y]
      @dict.deep_merge!(:spanish => {i => 4})
    end

    for i in %w[J]
      @dict.deep_merge!(:spanish => {i => 6})
    end

    for i in %w[K LL Ñ Q RR W X]
      @dict.deep_merge!(:spanish => {i => 8})
    end

    for i in %w[Z]
      @dict.deep_merge!(:spanish => {i => 10})
    end

  end

  def score_letter(letter)

    letter = letter.upcase
    if @dict.keys.include?(@language)
      if @dict[@language].keys.include?(letter)
        @dict[@language][letter]
      else
        puts "Invalid Character"      # Tells user that character is not included in set
        0
      end
    else
      puts "Invalid Language"         # Tells user that language input is invalid
      0
    end
  end
end
