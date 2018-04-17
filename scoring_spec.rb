# frozen_string_literal: true

require_relative 'scoring'

RSpec.describe Scoring do
  subject { described_class.new }

  describe '#score_letter' do
    # Test English
    context 'in English' do
      # Test in English for Uppercase
      %w[A E I O U L N R S T].each do |letter|
        it "scores a #{letter} as 1 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 1
        end
      end

      %w[D G].each do |letter|
        it "scores a #{letter} as 2 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 2
        end
      end

      %w[B C M P].each do |letter|
        it "scores a #{letter} as 3 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 3
        end
      end

      %w[F H V W Y].each do |letter|
        it "scores a #{letter} as 4 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 4
        end
      end

      %w[K].each do |letter|
        it "scores a #{letter} as 5 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 5
        end
      end

      %w[J X].each do |letter|
        it "scores a #{letter} as 8 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 8
        end
      end

      %w[Q Z].each do |letter|
        it "scores a #{letter} as 10 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 10
        end
      end
      # End Test in English for Uppercase
      
      # Test in English for Lowecase
      %w[a e i o u l n r s t].each do |letter|
        it "scores a #{letter} as 1 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 1
        end
      end

      %w[d g].each do |letter|
        it "scores a #{letter} as 2 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 2
        end
      end

      %w[b c m p].each do |letter|
        it "scores a #{letter} as 3 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 3
        end
      end

      %w[f h v w y].each do |letter|
        it "scores a #{letter} as 4 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 4
        end
      end

      %w[k].each do |letter|
        it "scores a #{letter} as 5 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 5
        end
      end

      %w[j x].each do |letter|
        it "scores a #{letter} as 8 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 8
        end
      end

      %w[q z].each do |letter|
        it "scores a #{letter} as 10 point" do
          expect(described_class.new(:english).score_letter(letter))
            .to eq 10
        end
      end
      # End Test in English for Lowercase
    end # End Test in English 

    # Test Spanish
    # Test Spanish in Uppercase
    context 'in Spanish' do
      %w[A E O S I U N L R T].each do |letter|
        it "scores a #{letter} as 1 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 1
        end
      end
      
      %w[C D G].each do |letter|
        it "scores a #{letter} as 2 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 2
        end
      end
      
      %w[B M P].each do |letter|
        it "scores a #{letter} as 3 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 3
        end
      end

      %w[F H V Y].each do |letter|
        it "scores a #{letter} as 4 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 4
        end
      end
      
      %w[J].each do |letter|
        it "scores a #{letter} as 6 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 6
        end
      end
      
      %w[K LL Ñ Q RR W X].each do |letter|
        it "scores a #{letter} as 8 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 8
        end
      end
      
      %w[Z].each do |letter|
        it "scores a #{letter} as 10 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 10
        end
      end
      # End Test in Spanish for Uppercase
      
      # Start Test for Spanish in Lowercase
      %w[a e o s i u n l r t].each do |letter|
        it "scores a #{letter} as 1 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 1
        end
      end
      
      %w[c d g].each do |letter|
        it "scores a #{letter} as 2 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 2
        end
      end
      
      %w[b m p].each do |letter|
        it "scores a #{letter} as 3 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 3
        end
      end

      %w[f h v y].each do |letter|
        it "scores a #{letter} as 4 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 4
        end
      end
      
      %w[j].each do |letter|
        it "scores a #{letter} as 6 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 6
        end
      end
      
      %w[k ll ñ q rr w x].each do |letter|
        it "scores a #{letter} as 8 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 8
        end
      end
      
      %w[z].each do |letter|
        it "scores a #{letter} as 10 point" do
          expect(described_class.new(:Spanish).score_letter(letter))
            .to eq 10
        end
      end
      # End Test for Spanish in Lowercase
    end # End Test in Spanish
  end 
end
