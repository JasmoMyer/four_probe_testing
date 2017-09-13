# frozen_string_literal: true

require 'faraday'

class AntRepository
  def get
    Faraday.get('https://en.wikipedia.org/w/api.php', params).body
  end

  private

  def params
    { 
      action: 'query', 
      titles: 'Ant', 
      prop:   'revisions', 
      rvprop: 'content', 
      format: 'json'
    }
  end
end
