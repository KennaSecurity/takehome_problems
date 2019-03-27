require_relative 'scoring'

RSpec.configure do |config|
    describe 'Scoring' do
        before :each do
            @scoring = Scoring.new(:spanish)
        end

        describe score_letter do
            it 'returns the right score' do
                @scoring.score_letter("J")
                expect @scoring.score_letter.to eq 6
            end
        end
    end
end