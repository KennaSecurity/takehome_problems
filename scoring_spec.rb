# frozen_string_literal: true

require_relative 'scoring'

RSpec.describe Scoring do
  # I think the tests (And the scoring) should be done by country and not necessarily just by language due to dialect.
  # This is more relevant for Spanish but different letters differ in frequency by dialect.
  # I am not sure if there is a better way to refactor this and I was thinking of having this load countries based
  # on the loading type and not hard coding the letter scores but that is probably ok for this case.
  describe '#score_letter' do
    context 'in Canada' do
      subject { described_class.new("CANADA") }

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
    # I thought I should have some sort of test around the letter not being scoreable.
    # I think it should be an exception but this is what the spec had
      %w[Ó %].each do |letter|
        it "scores a #{letter} as 10 point" do
          expect(subject.score_letter(letter))
              . to eq 0
        end
      end

    # In case of lowercase input, I think the scoring should be the same
    # one letter from each category
      %w[a d b f j k z].each do |letter|
        it "scores lowercase #{letter} the same as uppercase" do
          expect(subject.score_letter(letter))
              . to eq subject.score_letter(letter.upcase)
        end
      end
    end

    context 'in Mexico' do
      subject { described_class.new("MEXICO") }

      %w[A E O S I U N L R T].each do |letter|
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
              .to eq 5
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
        %w[Ó %].each do |letter|
          it "scores a #{letter} as 0 point" do
            expect(subject.score_letter(letter))
             . to eq 0
          end
        end
        %w[a d b f j k z].each do |letter|
          it "scores lowercase #{letter} the same as uppercase" do
            expect(subject.score_letter(letter))
            . to eq subject.score_letter(letter.upcase)
          end
        end
      end
    end
  end
