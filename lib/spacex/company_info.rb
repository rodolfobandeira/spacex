# frozen_string_literal: true

require 'ostruct'

module SPACEX
  module CompanyInfo
    ROOT_URI = 'https://api.spacexdata.com/v2'

    def self.info
      path = 'info'

      data = Faraday.new(
        url: "#{ROOT_URI}/#{path}",
        request: {
          params_encoder: Faraday::FlatParamsEncoder
        }
      ) do |c|
        c.use ::FaradayMiddleware::ParseJson
        c.use Faraday::Response::RaiseError
        c.use Faraday::Adapter::NetHttp
      end
      Hashie::Mash.new(data.get.body)
    end
  end
end
