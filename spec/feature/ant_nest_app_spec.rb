# frozen_string_literal: true

require_relative '../spec_helper'

describe 'Visiting the index page', type: :feature do
  before(:each) do
    visit '/'
  end

  it 'we see the main page header' do
    expect(page.body).to have_css('h1#main', text: 'Hi, little Aardvark!')
  end
end
