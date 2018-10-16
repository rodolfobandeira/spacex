module SPACEX
  module Launches
    def self.latest
      SPACEX::BaseRequest.info('launches/latest')
    end

    def self.next
      SPACEX::BaseRequest.info('launches/next')
    end

    def self.all
      SPACEX::BaseRequest.info('launches')
    end

    def self.info
      all
    end
  end
end
