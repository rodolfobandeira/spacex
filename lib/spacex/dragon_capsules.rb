require_relative '../resource_service'

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

    class << self
      include ResourceService

      def info(dragon_id = nil)
        get(dragon_id)
      end

      private

      def get(dragon_id = nil)
        return retrieve_all('dragons') if dragon_id.nil?

        data = SPACEX::BaseRequest.get("dragons/#{dragon_id}")
        SPACEX::DragonCapsules.new(data)
      end
    end
  end
end
