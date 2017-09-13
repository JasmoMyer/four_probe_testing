require 'sinatra/base'

class AntNestApp < Sinatra::Base
  get '/' do
  	@ants = "we'll get you some ant-related data from Wikipedia, shortly."
    erb :index
  end
end
