module SPACEX
  module V4
    class Rockets
      def self.info(id = nil, _query = {})
        SPACEX::BaseRequest.info("rockets/#{id}", nil, 'v4')
      end
    end
  end
end
