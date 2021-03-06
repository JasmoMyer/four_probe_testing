# frozen_string_literal: true

#===============================================================#
#                  SHARED TEST CONFIGURATION:
#===============================================================#
# FOR:
#
# - UNITS
# - INTEGRATIONS
# - FEATURES
#
# (SMOKE test configuration is in spec_smoke/spec_helper.rb)
#===============================================================#

ENV['RACK_ENV'] = 'test'

require 'bundler'
Bundler.setup(:default, :test)

require_relative '../lib/middleware/topsoil'
require_relative '../lib/ant_nest_entrypoint'

#================================================================# 
#               INTEGRATION TEST CONFIGURATION:
#================================================================#

require 'rack/test'

#================================================================# 
#                FEATURE TEST CONFIGURATION:
#================================================================#
# CAPYBARA:
# - provides DSL for visiting and interrogating pages
#
# POLTERGEIST & PHANTOMJS:
# - driver and headless browser for visitng pages
#
# VCR:
# - intercept requests-to, and record responses-from any services 
#   we're dependent on, for mocking purposes
#================================================================#

require 'capybara/rspec'
require 'capybara/poltergeist'
require 'vcr'

# CAPYBARA, POLTERGEIST & PHANTOMJS
Capybara.include Capybara::DSL
Capybara.include Capybara::RSpecMatchers

Capybara.register_driver :poltergeist do |app|
  options = {
    timeout:           120,
    inspector:         true,
    phantomjs_options: [
      '--disk-cache=false',
      '--local-storage-path=/dev/null'
    ]
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.configure do |config|
  config.app = Rack::Builder.new do
    run AntNestEntrypoint
  end
  config.server_port       = 7000
  config.run_server        = true
  config.default_driver    = :poltergeist
  config.javascript_driver = :poltergeist
  config.app_host          = 'http://localhost:7000'
end

# VCR
VCR.configure do |config|
  config.cassette_library_dir = File.join(__dir__, 'support/fixtures/vcr_cassettes')
  config.hook_into                               :faraday
  config.ignore_localhost                        = true
  config.allow_http_connections_when_no_cassette = false
end
