module SPACEX
  module Launches
    def self.latest
      SPACEX::BaseRequest.get('launches/latest')
    end

    def self.all
      SPACEX::BaseRequest.get('launches')
    end
  end
end
