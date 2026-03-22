module SPACEX
  class Ships < SPACEX::Resource
    property 'abs'
    property 'active'
    property 'course_deg'
    property 'home_port'
    property 'id'
    property 'image'
    property 'imo'
    property 'last_ais_update'
    property 'latitude'
    property 'launches'
    property 'legacy_id'
    property 'link'
    property 'longitude'
    property 'mass_kg'
    property 'mass_lbs'
    property 'mmsi'
    property 'model'
    property 'name'
    property 'roles'
    property 'speed_kn'
    property 'status'
    property 'type'
    property 'year_built'

    def self.info(id = nil)
      SPACEX::BaseRequest.info("ships/#{id}", SPACEX::Ships)
    end
  end
end
