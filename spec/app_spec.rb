require 'spec_helper'
require_relative '../app'
require 'rack/app/test'

describe App do
  include Rack::App::Test

  rack_app described_class

  describe '/cover' do
    let(:params) { { title: 'Le Petit Prince', author: 'Le pilote français' } }
    let(:expected_body) do
      File.open("#{__dir__}/../cover.png", 'rb') { |f| f.read }
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
