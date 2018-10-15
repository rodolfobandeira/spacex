module SPACEX
  module Rockets
    def self.info(rocket_id = nil)
      SPACEX::BaseRequest.info("rockets/#{rocket_id}")
    end
  end
end
