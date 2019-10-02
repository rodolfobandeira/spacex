module SPACEX
  module LandingPads
    def self.info(id = nil)
      SPACEX::BaseRequest.info("landpads/#{id}")
    end

    def self.all
      info
    end
  end
end
