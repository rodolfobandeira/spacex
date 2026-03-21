# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))

require 'coverage_helper'
require 'pry' unless ENV['CI']

require 'rubygems'
require 'rspec'
require 'spacex'

Dir[File.join(File.dirname(__FILE__), 'support', '**/*.rb')].sort.each do |file|
  require file
end
