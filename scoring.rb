# frozen_string_literal: true

class Scoring
  def initialize(language = :english)
    @language = language # set language (defaults to english)
  end

  def score_letter(letter)
    if @language == :english
      score_english(letter)
    elsif @language == :spanish
      score_spanish(letter)
    else
      puts "\e[31mcurrently does not support the #{@language} language\e[0m"
      return nil
    end
  end

  def score_english(letter)
    if %w[A E I O U L N R S T].include?(letter)
      return 1
    elsif %w[D G].include?(letter)
      return 2
    elsif %w[B C M P].include?(letter)
      return 3
    elsif %w[F H V W Y].include?(letter)
      return 4
    elsif %w[K].include?(letter)
      return 5
    elsif %w[J X].include?(letter)
      return 8
    elsif %w[Q Z].include?(letter)
      return 10
    else
      return 0
    end
  end

  def score_spanish(letter)
    if %w[A E O S I U N L R T].include?(letter)
      return 1
    elsif %w[C D G].include?(letter)
      return 2
    elsif %w[B M P].include?(letter)
      return 3
    elsif %w[F H V Y].include?(letter)
      return 4
    elsif %w[J].include?(letter)
      return 6
    elsif %w[K LL Ñ Q RR W X].include?(letter)
      return 8
    elsif %w[Z].include?(letter)
      return 10
    else
      return 0
    end
  end
end
