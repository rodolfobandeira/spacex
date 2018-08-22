# frozen_string_literal: true

module SPACEX
  module CompanyInfo
    def self.info
      SPACEX::BaseRequest.get('info')
    end
  end
end
