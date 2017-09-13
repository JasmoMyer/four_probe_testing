# frozen_string_literal: true

require 'sinatra/base'
require_relative 'ant_nest'

class AntNestApp < Sinatra::Base
  get '/' do
    @ants = available_ants
    erb :index
  end

  def available_ants
  	env['topsoil_too_dry?'] ? 'Sorry, no ants today!' : AntNest.new.get
  end
end
