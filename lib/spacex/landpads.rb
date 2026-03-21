module SPACEX
  class Landpads < SPACEX::Resource
    property 'details'
    property 'full_name'
    property 'id'
    property 'images'
    property 'landing_attempts'
    property 'landing_successes'
    property 'latitude'
    property 'launches'
    property 'locality'
    property 'longitude'
    property 'name'
    property 'region'
    property 'status'
    property 'type'
    property 'wikipedia'

    def self.info(id = nil)
      SPACEX::BaseRequest.info("landpads/#{id}", SPACEX::Landpads)
    end
  end
end
