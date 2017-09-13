# frozen_string_literal: true

require_relative '../spec_helper'

describe 'Visiting the index page', type: :feature do
  before(:each) do
  	VCR.use_cassette(:wikipedia_response) do
      visit '/'
    end
  end

  it 'we see the main page header' do
    expect(page.body).to have_css('h1#main', text: 'Hi, little Aardvark!')
  end

  it 'presents some ant-related data' do
    expect(page.body).to include('"title":"Ant"')
  end
end
