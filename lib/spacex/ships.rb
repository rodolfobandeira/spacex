module SPACEX
  class Ships < Hashie::Trash
    include Hashie::Extensions::IgnoreUndeclared

    property 'ship_id', from: 'id'
    property 'ship_name'
    property 'ship_model'
    property 'ship_type'
    property 'roles'
    property 'active'
    property 'imo'
    property 'mmsi'
    property 'abs'
    property 'ship_class', from: 'class'
    property 'weight_lbs'
    property 'weight_kg'
    property 'year_built'
    property 'home_port'
    property 'status'
    property 'speed_kn'
    property 'course_deg'
    property 'position'
    property 'successful_landings'
    property 'attempted_landings'
    property 'missions'
    property 'url'
    property 'image'

    def self.info(ship_id = nil)
      SPACEX::BaseRequest.info("ships/#{ship_id}", SPACEX::Ships)
    end
  end
end
