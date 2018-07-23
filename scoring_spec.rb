# frozen_string_literal: true

require_relative 'scoring'

RSpec.describe Scoring do
  subject { described_class.new }

  describe '#score_letter' do
    context 'in English' do
      %w[A E I O U L N R S T].each do |letter|
        it "scores a #{letter} as 1 point" do
          expect(subject.score_letter(letter))
            .to eq 1
        end
      end

      %w[D G].each do |letter|
        it "scores a #{letter} as 2 point" do
          expect(subject.score_letter(letter))
            .to eq 2
        end
      end

      %w[B C M P].each do |letter|
        it "scores a #{letter} as 3 point" do
          expect(subject.score_letter(letter))
            .to eq 3
        end
      end

      %w[F H V W Y].each do |letter|
        it "scores a #{letter} as 4 point" do
          expect(subject.score_letter(letter))
            .to eq 4
        end
      end

      %w[K].each do |letter|
        it "scores a #{letter} as 5 point" do
          expect(subject.score_letter(letter))
            .to eq 5
        end
      end

      %w[J X].each do |letter|
        it "scores a #{letter} as 8 point" do
          expect(subject.score_letter(letter))
            .to eq 8
        end
      end

      %w[Q Z].each do |letter|
        it "scores a #{letter} as 10 point" do
          expect(subject.score_letter(letter))
            .to eq 10
        end
      end
    end

    context 'in Spanish' do
      language = :spanish
      subject { described_class.new(language: language) }

      %w[A E I O U L N R S T].each do |letter|
        it "scores a #{letter} as 1 point" do
          expect(subject.score_letter(letter))
            .to eq 1
        end
      end

      %w[C D G].each do |letter|
        it "scores a #{letter} as 2 point" do
          expect(subject.score_letter(letter))
            .to eq 2
        end
      end

      %w[B M P].each do |letter|
        it "scores a #{letter} as 3 point" do
          expect(subject.score_letter(letter))
            .to eq 3
        end
      end

      %w[F H V Y].each do |letter|
        it "scores a #{letter} as 4 point" do
          expect(subject.score_letter(letter))
            .to eq 4
        end
      end

      %w[J].each do |letter|
        it "scores a #{letter} as 5 point" do
          expect(subject.score_letter(letter))
            .to eq 6
        end
      end

      %w[K LL Ñ Q RR W X].each do |letter|
        it "scores a #{letter} as 8 point" do
          expect(subject.score_letter(letter))
            .to eq 8
        end
      end

      %w[Z].each do |letter|
        it "scores a #{letter} as 10 point" do
          expect(subject.score_letter(letter))
            .to eq 10
        end
      end
    end
  end

  describe '#language settings' do
    context "English language setting" do
      it "defaults to English tile set when no other language input is set" do
        expect(subject.language).to be :english
      end

      it "should return an integer for English inputs" do
        expect(subject.score_letter("A")).to be_a(Integer)
        expect(subject.score_letter("B")).to be_a(Integer)
      end

      it "recognizes bad letter input" do
        expect(subject.score_letter("RR")).to be 0
        expect(subject.score_letter(7)).to be 0
      end
    end

    context "Spanish language setting" do
      language = :spanish
      subject { described_class.new(language: language) }

      it "switches from default English to Spanish tile set when intialized with new language setting" do
        expect(subject.language).to be :spanish
      end

      it "should return an integer for Spanish inputs" do
        expect(subject.score_letter("A")).to be_a(Integer)
        expect(subject.score_letter("B")).to be_a(Integer)
        expect(subject.score_letter("Ñ")).to be_a(Integer)
      end

      it "recognizes bad letter input" do
        expect(subject.score_letter("TTT")).to be 0
        expect(subject.score_letter(7)).to be 0
      end
    end

  end
end
