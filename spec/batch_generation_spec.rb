require 'spec_helper'
require_relative '../app/batch_generation'

RSpec.describe BatchGeneration do
  describe '.call' do
    let(:csv_file) { File.open("#{__dir__}/fixtures/books.csv") }

    specify do
      expect(CoverGenerator).
        to receive(:new).and_return(double(call: true)).exactly(2).times

      described_class.new(csv_file).call
    end
  end
end
