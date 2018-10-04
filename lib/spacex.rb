# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'faraday_middleware/response_middleware'
require 'hashie'

require_relative 'spacex/base_request'
require_relative 'spacex/version'
require_relative 'spacex/launches'
require_relative 'spacex/company_info'
require_relative 'spacex/roadster'
require_relative 'spacex/dragon_capsules'
require_relative 'spacex/ships'
