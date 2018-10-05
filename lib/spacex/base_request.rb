require 'byebug'

module SPACEX
  class Response < Hashie::Mash
    disable_warnings
  end

  module BaseRequest
    def self.get(path)
      data = call_api(path)
      SPACEX::Response.new(data.get.body)
    end

    def self.retrieve_all(path)
      data = call_api(path)
      data.get.body.map { |k| [k] }
    end

    def self.call_api(path)
      Faraday.new(
        url: "#{SPACEX::ROOT_URI}/#{path}",
        request: {
          params_encoder: Faraday::FlatParamsEncoder
        }
      ) do |c|
        c.use ::FaradayMiddleware::ParseJson
        c.use Faraday::Response::RaiseError
        c.use Faraday::Adapter::NetHttp
      end
    end
  end
end
