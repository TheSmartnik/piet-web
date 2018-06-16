require 'spec_helper'
require_relative '../app/cover_api'
require_relative '../app/cover_generator'
require 'rack/app/test'

describe CoverApi do
  include Rack::App::Test

  rack_app described_class

  describe '/cover' do
    let(:params) { { title: 'Le Petit Prince', author: 'Le pilote français' } }

    let(:cover_path) { "#{__dir__}/fixtures/test_cover.png" }
    let(:cover) { File.open(cover_path, 'rb') }
    let!(:expected_body) do
      FileUtils.cp("#{__dir__}/fixtures/cover.png", cover_path)
      File.open(cover_path, 'rb') { |f| f.read }
    end

    before do
      allow(CoverGenerator).
        to receive(:new).and_return(double(call: double(cover_path: cover.path)))
    end

    subject{ get(url: '/cover', params: params) }

    its(:status) { is_expected.to eq 200 }
    its(:body) { is_expected.to eq expected_body }

    context 'when params are missing' do
      let(:params) { { title: 'some' } }

      it { expect(subject.status).to eq 422 }
    end
  end
end
