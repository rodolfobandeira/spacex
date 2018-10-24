module SPACEX
  module Payloads
    def self.info(id = nil)
      SPACEX::BaseRequest.info("payloads/#{id}")
    end
  end
end
