module SPACEX
  class History < SPACEX::Resource
    property 'details'
    property 'event_date_unix'
    property 'event_date_utc'
    property 'id'
    property 'links'
    property 'title'

    def self.info(id = nil)
      SPACEX::BaseRequest.info("history/#{id}", SPACEX::History)
    end
  end
end
