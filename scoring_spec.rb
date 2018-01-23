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

      %w[1 -23 blank false RR].each do |invalid_input|
        it "scores invalid input of #{invalid_input} as 0 points" do 
          expect(subject.score_letter(invalid_input)).to eq 0
        end 
      end 
    end


    context 'in Spanish' do
      let (:language) {:spanish}
      subject { described_class.new(language) }

      %w[A E O S I U N L R T].each do |letter|
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

      %w[1 -23 blank CH false].each do |invalid_input|
        it "scores invalid input of #{invalid_input} as 0 points" do 
          expect(subject.score_letter(invalid_input)).to eq 0
        end 
      end
    end 

    context 'in French' do
      let (:language) {:french}
      subject { described_class.new(language) }

      %w[A E O S I U N L R T].each do |letter|
        it "scores a #{letter} as 1 point" do
          expect(subject.score_letter(letter))
            .to eq 1
        end
      end

      %w[D G M].each do |letter|
        it "scores a #{letter} as 2 point" do
          expect(subject.score_letter(letter))
            .to eq 2
        end
      end

      %w[B C P].each do |letter|
        it "scores a #{letter} as 3 point" do
          expect(subject.score_letter(letter))
            .to eq 3
        end
      end

      %w[F H V].each do |letter|
        it "scores a #{letter} as 4 point" do
          expect(subject.score_letter(letter))
            .to eq 4
        end
      end

      %w[J Q].each do |letter|
        it "scores a #{letter} as 8 point" do
          expect(subject.score_letter(letter))
            .to eq 8
        end
      end

      %w[K W X Y Z].each do |letter|
        it "scores a #{letter} as 10 point" do
          expect(subject.score_letter(letter))
            .to eq 10
        end
      end

      %w[1 -23 blank false LL].each do |invalid_input|
        it "scores invalid input of #{invalid_input} as 0 points" do 
          expect(subject.score_letter(invalid_input)).to eq 0
        end 
      end
    end 
  end

  describe '#sanitize_input' do 

    it "removes single quotes from input and upcases the result" do 
      expect(subject.sanitize_input("Here is 'a string'")).to eq "Here is a string"
    end 

    it "removes forward and back slashes from input and upcases the result" do 
      expect(subject.sanitize_input(" / and \ ")).to eq "  and  "
    end 

    it "removes script tags from input" do 
      expect(subject.sanitize_input("<script> bad things here </script>")).to eq "script bad things here script"
    end 
  end 

  describe '#format_input' do 

    it "upcases any lowercase letters" do 
      expect(subject.format_input("abcd")).to eq "ABCD"
    end 

    it "removes diacritical marks" do 
      expect(subject.format_input("À Â Ä")).to eq "A A A"
    end 

    it "does not remove tilde" do 
      expect(subject.format_input("Ñ")).to eq "Ñ"
    end 
  end 

end
