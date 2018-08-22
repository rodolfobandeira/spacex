# frozen_string_literal: true

module SPACEX
  module Roadster
    def self.info
      SPACEX::BaseRequest.get('info/roadster')
    end
  end
end
