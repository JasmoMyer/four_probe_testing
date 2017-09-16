# frozen_string_literal: true

require_relative 'spec_helper'

feature 'Visiting the index page in production' do
  background(:each) do
    visit '/'
  end

  scenario 'the page loads successfully' do
    expect(page.status_code).to eq(200)
  end

  scenario 'the main page header is displayed' do
    expect(page.body).to have_css('h1#main', text: 'Hi, little Aardvark!')
  end

  scenario 'ant-related data is displayed' do
    expect(page.body).to include('"title":"Ant"')
  end
end
