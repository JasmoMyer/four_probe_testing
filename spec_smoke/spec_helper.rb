# frozen_string_literal: true

#===============================================================#
#                  SMOKE TEST CONFIGURATION:
#===============================================================#
# CAPYBARA:
# - provides DSL for visiting and interrogating pages
#
# POLTERGEIST & PHANTOMJS:
# - driver and headless browser for visitng pages
#================================================================#

ENV['RACK_ENV'] = 'test'

require 'bundler'
Bundler.setup(:default, :test)

require 'capybara/rspec'
require 'capybara/poltergeist'
require 'colorize'

RSpec.configure do |config|
  config.before(:all) do
    app_host = ENV['SMOKE_TEST_HOST']
    puts "Running Smoke Tests against #{app_host}".blue

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

    Capybara.include Capybara::DSL
    Capybara.include Capybara::RSpecMatchers

    Capybara.configure do |config|
      config.default_driver    = :poltergeist
      config.javascript_driver = :poltergeist
      config.app_host          = app_host
    end
  end
end
