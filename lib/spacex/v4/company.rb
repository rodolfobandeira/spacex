module SPACEX
  module V4
    class Company
      def self.info
        SPACEX::BaseRequest.info('company', nil, 'v4')
      end
    end
  end
end
