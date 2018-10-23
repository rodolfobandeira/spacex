module SPACEX
  module Launches
    def self.info(flight_number = nil)
      SPACEX::BaseRequest.info("launches/#{flight_number}")
    end

    def self.latest
      SPACEX::BaseRequest.info('launches/latest')
    end

    def self.next
      SPACEX::BaseRequest.info('launches/next')
    end

    def self.all
      info
    end
  end
end
