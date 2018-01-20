# -*- coding: utf-8 -*-

# frozen_string_literal: true

class Scoring
  attr_accessor :language

  ENGLISH = {
    %w[A E I O U L N R S T] => 1,
    %w[D G] => 2,
    %w[B C M P] => 3,
    %w[F H V W Y] => 4,
    %w[K] => 5,
    %w[J X] => 8,
    %w[Q Z] => 10
  }.freeze

  SPANISH = {
    %w[A E O S I U N L R T] => 1,
    %w[C D G] => 2,
    %w[B M P] => 3,
    %w[F H V Y] => 4,
    %w[J] => 6,
    %w[K LL Ñ Q RR W X] => 8,
    %w[Z] => 10
  }.freeze

  def scoring_table
    case language
    when :english then ENGLISH
    when :spanish then SPANISH
    end
  end

  def initialize(language = :english)
    @language = language
  end

  def score_letter(letter)
    key = scoring_table.select { |k| k.include? letter }
    key.first.last
  end
end
