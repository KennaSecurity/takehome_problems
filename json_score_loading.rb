require "json"


# So this class is designed to load the scores necessary. It could be injected into multiple games and the map location
# Could be configured. My ideal here would be to stick an interface here with get_scoring_map_by_language so that way
# you could decouple the loading to a database or something similar.
# I structured the data as multiple letters per score so that it would be smaller to type and store but then it is
# converted into a map so that it is faster to look up single letters. This would also act as a cache to prevent
# repeated database calls
class JSONScoreLoading

  def initialize()
    @map_location = "data/scoring_file.json"
    @json_data = File.read(@map_location)
    @language_maps = self.load_language_maps
  end

  # Json is structured { COUNTRY: {COMMA_SEPARATED_LETTERS: SCORE}}
  # This creates a dictionary { COUNTRY: {LETTER: SCORE}}
  # I think its cleaner as a single lookup in the converted structure
  def load_language_maps
    raw_language_map = JSON.parse(@json_data)
    language_map = Hash.new
    raw_language_map.each do |language, letter_map|
      score_map = Hash.new
      score_map.default = 0
      language_map[language] = score_map
      letter_map.each do |letter_string, value|
        letter_string.split(',').each do |letter|
          language_map[language][letter] = value
        end
      end
    end
    language_map
  end

  def get_scoring_map_by_language(language)
    @language_maps[language.upcase]
  end

end