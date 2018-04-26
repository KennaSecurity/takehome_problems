# frozen_string_literal: true

class Scoring
  ENGLISH_LETTER_SCORES = {
    %w[A E I O U L N R S T] => 1,
    %w[D G]                 => 2,
    %w[B C M P]             => 3,
    %w[F H V W Y]           => 4,
    %w[K]                   => 5,
    %w[J X]                 => 8,
    %w[Q Z]                 => 10
  }
  SPANISH_LETTER_SCORES = {
    %w[A E O S I U N L R T] => 1,
    %w[C D G]               => 2,
    %w[B M P]               => 3,
    %w[F H V Y]             => 4,
    %w[J]                   => 6,
    %w[K LL Ñ Q RR W X]     => 8,
    %w[Z]                   => 10
  }

  attr_reader :language

  def initialize(language = :english)
    @language = language
  end

  def score_letter(letter)
    if language.downcase == :spanish
      score_spanish_letter(letter)
    elsif language.downcase == :english
      score_english_letter(letter)
    else
      puts 'Please enter a valid language'
    end
  end

  private

  def score_spanish_letter(letter)
    SPANISH_LETTER_SCORES.each do |letter_group, score|
      return score if letter_group.include?(letter)
    end
    0
  end

  def score_english_letter(letter)
    ENGLISH_LETTER_SCORES.each do |letter_group, score|
      return score if letter_group.include?(letter)
    end
    0
  end
end
