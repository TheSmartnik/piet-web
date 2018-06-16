require 'spec_helper'
require_relative '../app/cover_generator'

RSpec.describe CoverGenerator do
  describe '.call' do
    subject(:result) { described_class.new(title: 'title', author: 'author').call }

    after { File.delete(result.cover_path) }

    it { expect(File).to exist(result.cover_path) }
  end
end
