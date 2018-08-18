# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

Gem::Specification.new do |s|
  s.name        = 'spacex'
  s.version     = '0.0.1'
  s.date        = '2018-08-17'
  s.summary     = 'Swap SpaceX API with Ruby'
  s.description = 'Ruby library to consume SpaceX launch data'
  s.authors     = ['Rodolfo Bandeira']
  s.email       = 'rodolfobandeira@protonmail.com'
  s.files       = ['lib/spacex.rb']
  s.homepage    = 'http://rubygems.org/gems/spacex'
  s.license     = 'MIT'
  s.add_dependency 'faraday', '>= 0.9'
  s.add_dependency 'faraday_middleware'
  s.add_dependency 'hashie'
  s.add_development_dependency 'rake', '~> 10'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop', '0.51.0'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
