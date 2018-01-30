# frozen_string_literal: true

require_relative "json_score_loading"

# So I kind of went a little overboard here. I basically thought of this as a mapping of single letters to a score that
# was defined by what country you are in. I didn't really like implementing it as hard coded if statements because if
# any changes needed to be made then you'd have to make code changes. That sounds annoying to me. Though the tests are
# still hard coded.
# Basically I stuck a loading file in here so there would be a decoupled loader that was separated from the scoring
# numbers themselves
# I am not sure this is the most idiomatic way of doing the project but this is my first experience with ruby

class Scoring

  def initialize(language)
    score_loader = JSONScoreLoading.new
    # Ideally this could be subbed out for any other score loader
    @scoring_map = score_loader.get_scoring_map_by_language(language)
  end

  def score_letter(letter)
    @scoring_map[letter.upcase]
  end
end
