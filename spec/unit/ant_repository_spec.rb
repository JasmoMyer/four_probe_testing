# frozen_string_literal: true

require_relative '../spec_helper'

describe AntRepository do
  describe '#ants' do
  	let(:faraday_response) { double('Faraday::Response', body: ant_data) }
  	let(:ant_data)         { 'Mock ant data' }

    before do
      allow(Faraday).to receive(:get).and_return(faraday_response)
    end

    it 'returns some ant data' do
      expect(subject.get).to eq('Mock ant data')
    end
  end
end
