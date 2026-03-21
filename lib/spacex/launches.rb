module SPACEX
  class Launches < SPACEX::Resource
    property 'auto_update'
    property 'capsules'
    property 'cores'
    property 'crew'
    property 'date_local'
    property 'date_precision'
    property 'date_unix'
    property 'date_utc'
    property 'details'
    property 'failures'
    property 'fairings'
    property 'flight_number'
    property 'id'
    property 'launch_library_id'
    property 'launchpad'
    property 'links'
    property 'name'
    property 'net'
    property 'payloads'
    property 'rocket'
    property 'ships'
    property 'static_fire_date_unix'
    property 'static_fire_date_utc'
    property 'success'
    property 'tbd'
    property 'upcoming'
    property 'window'

    def self.info(id = nil)
      SPACEX::BaseRequest.info("launches/#{id}", SPACEX::Launches)
    end

    def self.latest
      SPACEX::BaseRequest.info('launches/latest', SPACEX::Launches)
    end

    def self.next
      SPACEX::BaseRequest.info('launches/next', SPACEX::Launches)
    end

    def self.past
      SPACEX::BaseRequest.info('launches/past', SPACEX::Launches)
    end

    def self.upcoming
      SPACEX::BaseRequest.info('launches/upcoming', SPACEX::Launches)
    end
  end
end
