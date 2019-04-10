# frozen_string_literal: true

class Scoring

  # Hash object containing language letter-value pairs
  Languages = {
    :spanish => {
      %w[A E O S I U N L R T] => 1,
      %w[C D G] => 2,
      %w[B M P] => 3,
      %w[F H V Y] => 4,
      %w[J] => 6,
      %w[K LL Ñ Q RR W X] => 8,
      %w[Z] => 10
    },
    :english  => {
      %w[E A I O N R T L S U] => 1,
      %w[D G] => 2,
      %w[B C M P] => 3,
      %w[F H V W Y] => 4,
      %w[K] => 5,
      %w[J X] => 8,
      %w[Q Z] => 10
    }
  }

  # Initializer, instantiating new objects with a language relevant point table
  def initialize(language = :english)
    @point_table = language
  end

  def score_letter(letter)
    if %w[A E I O U L N R S T].include?(letter)
      return 1
    elsif %w[D G].include?(letter)
      2
    elsif %w[B C M P].include?(letter)
      3
    elsif %w[F H V W Y].include?(letter)
      return 4
    elsif %w[K].include?(letter)
      5
    elsif %w[J X].include?(letter)
      8
    elsif %w[Q Z].include?(letter)
      10
    else
      0
    end
  end
end
