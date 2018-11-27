require_relative 'scoring'

language = :spanish
p Scoring.new(language).score_letter('C')
# returns 2