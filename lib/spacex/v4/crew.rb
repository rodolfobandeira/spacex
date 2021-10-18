module SPACEX
  module V4
    class Crew
      def self.info(id = nil, _query = {})
        SPACEX::BaseRequest.info("crew/#{id}", nil, 'v4')
      end
    end
  end
end
