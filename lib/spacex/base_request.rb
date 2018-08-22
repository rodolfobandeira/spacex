# frozen_string_literal: true

module SPACEX
  module BaseRequest
    def self.get(path)
      data = Faraday.new(
        url: "#{SPACEX::ROOT_URI}/#{path}",
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
