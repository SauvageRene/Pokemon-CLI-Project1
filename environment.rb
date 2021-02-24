#require all of our files so they can talk to each other
require 'bundler'
Bundler.require #require all gems listed in gem file

require_relative './lib/api.rb'
require_relative './lib/cli.rb'
require_relative './lib/pokemon.rb'