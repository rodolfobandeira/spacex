# frozen_string_literal: true

module SPACEX
  module DragonCapsules
    def self.info
      SPACEX::BaseRequest.getAll('dragons')
    end
  end
end
