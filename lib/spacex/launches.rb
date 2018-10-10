module SPACEX
  module Launches
    def self.latest
      SPACEX::BaseRequest.get('launches/latest')
    end
    
    def self.next
      SPACEX::BaseRequest.get('launches/next')
  end
end
