require 'spec_helper'
require_relative '../app/binary_cover'

RSpec.describe BinaryCover do
  describe '.file' do
    let(:cover_path) { "#{__dir__}/fixtures/test_cover.png" }
    let(:cover) { File.open(cover_path, 'rb') }

    before do
      FileUtils.cp("#{__dir__}/fixtures/cover.png", cover_path)

      allow(CoverGenerator).
        to receive(:new).and_return(double(call: double(cover_path: cover.path)))
    end

    subject(:binary) { described_class.new(title: 'title', author: 'author').call }

    specify do
      expect(binary).to eq cover.read
      expect(File).to_not exist(cover.path)
    end
  end
end
