# frozen_string_literal: true

module SPACEX
  module Capsules
    def self.info(index=nil)
      SPACEX::BaseRequest.getAll('capsules', index)
    end
  end
end
