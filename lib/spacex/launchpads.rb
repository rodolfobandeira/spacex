module SPACEX
  class Launchpads < SPACEX::Resource
    property 'details'
    property 'full_name'
    property 'id'
    property 'images'
    property 'latitude'
    property 'launch_attempts'
    property 'launch_successes'
    property 'launches'
    property 'locality'
    property 'longitude'
    property 'name'
    property 'region'
    property 'rockets'
    property 'status'
    property 'timezone'

    def self.info(id = nil)
      SPACEX::BaseRequest.info("launchpads/#{id}", SPACEX::Launchpads)
    end
  end
end
