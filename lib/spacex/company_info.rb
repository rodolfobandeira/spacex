module SPACEX
  module CompanyInfo
    def self.info
      SPACEX::BaseRequest.get('info')
    end
  end
end
