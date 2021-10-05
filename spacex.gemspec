$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'spacex/version'

Gem::Specification.new do |s|
  s.required_ruby_version = '>= 2.4'
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
  s.add_dependency 'faraday', '~> 0.9'
  s.add_dependency 'faraday_middleware', '~> 0.12'
  s.add_dependency 'hashie', '3.6.0'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'rake', '>= 12.3.3'
  s.add_development_dependency 'rspec', '~> 3.8'
  s.add_development_dependency 'rubocop', '0.51.0'
  s.add_development_dependency 'vcr', '~> 4'
  s.add_development_dependency 'webmock', '~> 3.4'
end
