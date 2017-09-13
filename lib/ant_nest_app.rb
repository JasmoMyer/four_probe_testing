# frozen_string_literal: true

require 'sinatra/base'
require_relative 'ant_repository'

class AntNestApp < Sinatra::Base
  get '/' do
    @ants = AntRepository.new.get
    erb :index
  end
end
