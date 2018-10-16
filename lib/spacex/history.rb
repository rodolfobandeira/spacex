module SPACEX
  module History
    def self.info(id = nil)
      SPACEX::BaseRequest.info("history/#{id}")
    end
  end
end
