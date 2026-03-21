module SPACEX
  class Rockets < SPACEX::Resource
    property 'active'
    property 'boosters'
    property 'company'
    property 'cost_per_launch'
    property 'country'
    property 'description'
    property 'diameter'
    property 'engines'
    property 'first_flight'
    property 'first_stage'
    property 'flickr_images'
    property 'height'
    property 'id'
    property 'landing_legs'
    property 'mass'
    property 'name'
    property 'payload_weights'
    property 'second_stage'
    property 'stages'
    property 'success_rate_pct'
    property 'type'
    property 'wikipedia'

    def self.info(id = nil)
      SPACEX::BaseRequest.info("rockets/#{id}", SPACEX::Rockets)
    end
  end
end
