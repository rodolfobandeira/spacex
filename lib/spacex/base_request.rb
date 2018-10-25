module SPACEX
  class Response < Hashie::Mash
    disable_warnings
  end

  module BaseRequest
    class << self
      def info(path, klass = nil, params = {})
        response_body = get(path, params).body
        process(response_body, klass)
      end

      private

      def get(path, params)
        conn(path).get do |req|
          req.params = params
        end
      end

      def process(response_body, klass)
        if response_body.is_a? Array
          response_body.map do |element|
            processed_response(element, klass)
          end
        else
          processed_response(response_body, klass)
        end
      end

      def processed_response(response, klass)
        if klass.nil?
          spacex_response(response)
        else
          klass.new(spacex_response(response))
        end
      end

      def spacex_response(response)
        SPACEX::Response.new(response)
      end

      def conn(path)
        Faraday.new(
          url: "#{SPACEX::ENDPOINT_URI}/#{path}",
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
end
