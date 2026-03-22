module SPACEX
  class Dragons < SPACEX::Resource
    property 'active'
    property 'crew_capacity'
    property 'description'
    property 'diameter'
    property 'dry_mass_kg'
    property 'dry_mass_lb'
    property 'first_flight'
    property 'flickr_images'
    property 'heat_shield'
    property 'height_w_trunk'
    property 'id'
    property 'launch_payload_mass'
    property 'launch_payload_vol'
    property 'name'
    property 'orbit_duration_yr'
    property 'pressurized_capsule'
    property 'return_payload_mass'
    property 'return_payload_vol'
    property 'sidewall_angle_deg'
    property 'thrusters'
    property 'trunk'
    property 'type'
    property 'wikipedia'

    def self.info(id = nil)
      SPACEX::BaseRequest.info("dragons/#{id}", SPACEX::Dragons)
    end
  end
end
