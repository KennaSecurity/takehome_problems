# frozen_string_literal: true

require_relative 'json_score_loading'

RSpec.describe JSONScoreLoading do

  describe '#load_language_maps' do
    context 'test_json' do
      subject { described_class.new }
      # I don't know that this is idiomatic but i htink it works as a reasonable test
      expected_map = Hash["TEST_COUNTRY", Hash["A", 1, "C", 1, "B", 2]]

      it "map matches #{expected_map} test json map" do
        json_data = '{"TEST_COUNTRY": {"A,C": 1,"B": 2}}'
        subject.instance_variable_set(:@json_data, json_data)
        expect(subject.load_language_maps)
          .to eq expected_map
      end
    end
  end
end