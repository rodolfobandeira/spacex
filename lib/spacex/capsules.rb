# frozen_string_literal: true

module SPACEX
  module Capsules
    def self.info
      SPACEX::BaseRequest.getAll('capsules')
    end
  end
end
