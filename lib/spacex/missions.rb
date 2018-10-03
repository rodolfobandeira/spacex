# frozen_string_literal: true

module SPACEX
  module Missions
    def self.all
      SPACEX::BaseRequest.getAll('missions')
    end
  end
end
