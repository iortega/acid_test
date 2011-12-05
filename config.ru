require 'rubygems'
require 'bundler'

Bundler.require

require "resque/server"

require './app'
run Rack::URLMap.new \
  "/"       => Sinatra::Application,
  "/resque" => Resque::Server.new