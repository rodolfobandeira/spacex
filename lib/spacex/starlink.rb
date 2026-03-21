module SPACEX
  class Starlink < SPACEX::Resource
    property 'height_km'
    property 'id'
    property 'latitude'
    property 'launch'
    property 'longitude'
    property 'spaceTrack'
    property 'velocity_kms'
    property 'version'

    def self.info(id = nil)
      SPACEX::BaseRequest.info("starlink/#{id}", SPACEX::Starlink)
    end
  end
end
