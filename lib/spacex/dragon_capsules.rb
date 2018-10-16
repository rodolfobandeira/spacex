module SPACEX
  class DragonCapsules < Hashie::Trash
    include Hashie::Extensions::IgnoreUndeclared

    property 'capsule_id', from: 'id'
    property 'name'
    property 'type'
    property 'active'
    property 'crew_capacity'
    property 'sidewall_angle_deg'
    property 'orbit_duration_yr'
    property 'dry_mass_kg'
    property 'dry_mass_lb'
    property 'first_flight'
    property 'heat_shield'
    property 'thrusters'
    property 'launch_payload_mass'
    property 'launch_payload_vol'
    property 'return_payload_mass'
    property 'return_payload_vol'
    property 'pressurized_capsule'
    property 'trunk'
    property 'height_w_trunk'
    property 'diameter'
    property 'flickr_images'
    property 'wikipedia'
    property 'description'

    def self.info(dragon_id = nil)
      SPACEX::BaseRequest.info("dragons/#{dragon_id}", SPACEX::DragonCapsules)
    end
  end
end
