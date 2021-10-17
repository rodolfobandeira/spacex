module SPACEX
  module V4
    class Starlink
      def self.info(id = nil, _query = {})
        SPACEX::BaseRequest.info("starlink/#{id}", nil, 'v4')
      end
    end
  end
end
