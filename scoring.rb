# frozen_string_literal: true


class Scoring
  attr_reader :language

# benchmarking tests indicate that peformance is faster with the scores as keys
# also this is more legible
  ENGLISH_TILE_SET = {
    1 => %w[A E I O U L N R S T],
    2 => %w[D G],
    3 => %w[B C M P],
    4 => %w[F H V W Y],
    5 => %w[K],
    8 => %w[J X],
    10 => %w[Q Z]
  }

    SPANISH_TILE_SET = {
    1 => %w[A E I O U L N R S T],
    2 => %w[C D G],
    3 => %w[B M P],
    4 => %w[F H V Y],
    6 => %w[J],
    8 => %w[K LL Ñ Q RR W X],
    10 => %w[Z]
  }

  VALID_LANGUAGES = [:english, :spanish]

# defaults to english if no language parameter is provided upon initialization
  def initialize(args={})
    @language = args[:language] || :english
    validate!
  end

# considered returning an ArgumentError here instead of 0 but decided against it since the 0 provides greater flexibility as features are built out
  def score_letter(letter)
    tile_set.each do |score, tiles|
      if tiles.include?(letter)
        return score
      end
    end
    0
  end

  private

# sets tile set according to language parameter
  def tile_set
    case language
      when :english
        ENGLISH_TILE_SET
      when :spanish
        SPANISH_TILE_SET
    end
  end

# validates that language parameter is one of the available languages, otherwise raises exception
  def validate!
    raise ArgumentError.new("Invalid language setting") unless VALID_LANGUAGES.include?(language)
  end

end
