# -*- coding: utf-8 -*-
# frozen_string_literal: true

require_relative 'scoring'
require_relative 'scoring/languages'

RSpec.describe Scoring do
  # when a language has a scoring table, test each character for scoring
  Scoring::Languages.available.each do |symbol|
    context "in #{symbol.to_s.capitalize}" do
      subject { described_class.new symbol }
      language = Scoring::Languages.scoring_table_for(symbol)
      language.keys.each do |key|
        score = language.fetch(key)
        key.each do |letter|
          it "scores a #{letter} as #{score} points" do
            expect(subject.score_letter(letter))
              .to eq score
          end
        end
      end
    end
  end
end
