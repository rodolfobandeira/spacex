module SPACEX
  module Launches
    def self.latest
      SPACEX::BaseRequest.get('launches/latest')
    end

    def self.all
      SPACEX::BaseRequest.get('launches')
    end

    def self.info
      all
    end
  end
end
