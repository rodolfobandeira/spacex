# frozen_string_literal: true

module SPACEX
  module DragonCapsules
    def self.getAll
      SPACEX::BaseRequest.getAll('dragons')
    end

    def self.get(dragon_id = nil)
      return getAll if dragon_id.nil?

      SPACEX::BaseRequest.get("dragons/#{dragon_id}")
    end

    def self.info(dragon_id = nil)
      get(dragon_id)
    end
  end
end
