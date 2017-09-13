# frozen_string_literal: true

class Topsoil
  def initialize(app)
    @app = app
  end

  def call(env)
    dup.process(env)
  end

  def process(env)
    request = Rack::Request.new(env)

    if request.env['HTTP_USER_AGENT'] =~ /Parched/
      request.env['topsoil_too_dry?'] = true
    end

    @app.call(request.env)
  end
end
