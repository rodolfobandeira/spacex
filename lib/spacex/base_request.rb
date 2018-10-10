module SPACEX
  class Response < Hashie::Mash
    disable_warnings
  end

  module BaseRequest
    def self.get(path)
      data = call_api(path)
      response_body = data.get.body

      if response_body.is_a? Array
        response_body.map { |element| SPACEX::Response.new(element) }
      else
        SPACEX::Response.new(data.get.body)
      end
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
