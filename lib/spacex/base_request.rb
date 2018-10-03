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

    def self.getAll(path, index)
      if index
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

        i   = index - 1
        res = data.get.body[i]
        Hashie::Mash.new(res)
      else
        puts 'Please set number for Capsules, example (1)'
      end
    end
  end
end