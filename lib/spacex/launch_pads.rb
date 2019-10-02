module SPACEX
  module LaunchPads
    def self.info(site_id = nil)
      SPACEX::BaseRequest.info("launchpads/#{site_id}")
    end

    def self.all
      info
    end
  end
end
