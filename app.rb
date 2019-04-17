require 'rubygems'
require 'bundler'

require File.expand_path('..', __FILE__) + '/config/boot'

environment = (ENV['e'] || :development).to_sym

Bundler.require :default, environment

establish_connection environment
