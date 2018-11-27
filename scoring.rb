# frozen_string_literal: true

class Scoring
  def initialize(language)
    @scores = {}
    @language = create_scores(language)
  end

  def create_scores(language)
    if language.downcase == 'english'
      english_scores
    else
      'Please type in English or Spanish'
    end
  end

  def english_scores
    %w[A E I O U L N R S T].each_with_index { |item, index|
      @scores[item] = 1
    }

    %w[D G].each_with_index { |item, index|
      @scores[item] = 2
    }

    %w[B C M P].each_with_index { |item, index|
      @scores[item] = 3
    }

    %w[F H V W Y].each_with_index { |item, index|
      @scores[item] = 4
    }

    %w[K].each_with_index { |item, index|
      @scores[item] = 5
    }

    %w[J X].each_with_index { |item, index|
      @scores[item] = 8
    }

    %w[Q Z].each_with_index { |item, index|
      @scores[item] = 10
    }
  end

  def score_letter(letter)
    if !@scores.keys.include?(letter)
      0
    else
      @scores[letter]
    end
  end
end
