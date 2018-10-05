module SPACEX
  module Roadster
    def self.info
      SPACEX::BaseRequest.get('roadster')
    end
  end
end
