module SPACEX
  module Launches
    def self.latest
      SPACEX::BaseRequest.get('launches/latest')
    end
  end
end
