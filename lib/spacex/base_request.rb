module SPACEX
  BASE_URI = 'https://api.spacexdata.com'.freeze

  class Response < Hashie::Mash
    disable_warnings
  end

  module BaseRequest
    class << self
      def info(path, klass = nil)
        response_body = get(path).body
        process(response_body, klass)
      end

      private

      def get(path)
        conn(path).get
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
          url: "#{SPACEX::BASE_URI}/v4/#{path}",
          request: {
            params_encoder: Faraday::FlatParamsEncoder
          }
        ) do |connection|
          connection.response :json
          connection.use Faraday::Response::RaiseError
          connection.adapter ::Faraday.default_adapter
        end
      end
    end
  end
end
