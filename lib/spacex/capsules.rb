module SPACEX
  class Capsules < SPACEX::Resource
    property 'id'
    property 'land_landings'
    property 'last_update'
    property 'launches'
    property 'reuse_count'
    property 'serial'
    property 'status'
    property 'type'
    property 'water_landings'

    def self.info(id = nil)
      SPACEX::BaseRequest.info("capsules/#{id}", SPACEX::Capsules)
    end
  end
end
