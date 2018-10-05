# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'spacex/version'

Gem::Specification.new do |s|
  s.name        = 'spacex'
  s.bindir      = 'bin'
  s.version     = SPACEX::VERSION
  s.summary     = 'SpaceX API with Ruby'
  s.description = 'Ruby library to consume SpaceX launch data'
  s.authors     = ['Rodolfo Bandeira']
  s.email       = 'rodolfobandeira@protonmail.com'
  s.platform    = Gem::Platform::RUBY
  s.homepage    = 'https://github.com/rodolfobandeira/spacex'
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ['lib']
  s.add_dependency 'faraday', '>= 0.9'
  s.add_dependency 'faraday_middleware'
  s.add_dependency 'hashie', '3.6.0'
  s.add_development_dependency 'rake', '~> 10'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop', '0.51.0'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
