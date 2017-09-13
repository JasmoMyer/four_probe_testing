# frozen_string_literal: true

require 'spec_helper'

describe "AntNestApp's behaviour given Topsoil", type: :integration do
  include Rack::Test::Methods

  let(:app) do
    Rack::Builder.new do
      use Topsoil
      run AntNestApp
    end
  end
  
  let(:ant_repo) { double('AntRepository', get: 'Mock ant data') }
  let(:env)      { {} }
  let(:params)   { {} }

  before(:each) do
    allow(AntRepository).to receive(:new).and_return(ant_repo)

    VCR.use_cassette(:wikipedia_response) do
      get '/', params, env 
    end
  end

  context 'when Topsoil is fine' do
    specify 'AntNestApp DOES call the AntRepository' do
      expect(ant_repo).to have_received(:get)
    end
  end

  context 'when Topsoil is too dry' do
    let(:env) { { 'HTTP_USER_AGENT' => 'Parched browser (super-dry 3000)' } }
    
    specify 'AntNestApp does NOT call the AntRepository' do
      expect(ant_repo).not_to have_received(:get)
    end
  end
end
