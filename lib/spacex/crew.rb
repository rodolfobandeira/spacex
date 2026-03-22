module SPACEX
  class Crew < SPACEX::Resource
    property 'agency'
    property 'id'
    property 'image'
    property 'launches'
    property 'name'
    property 'status'
    property 'wikipedia'

    def self.info(id = nil)
      SPACEX::BaseRequest.info("crew/#{id}", SPACEX::Crew)
    end
  end
end
