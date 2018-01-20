# -*- coding: utf-8 -*-
# frozen_string_literal: true

require_relative 'scoring'
require_relative 'scoring/languages'

RSpec.describe Scoring do
  [:english, :spanish, :bulgarian, :estonian].each do |symbol|
    context "in #{symbol.to_s.capitalize}" do
      subject { described_class.new symbol }
      language = Scoring::Languages.scoring_table_for(symbol)
      if language.nil?
        binding.pry
      end
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

