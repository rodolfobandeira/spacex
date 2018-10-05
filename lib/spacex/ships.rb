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

    class << self
      def retrieve_all
        data = SPACEX::BaseRequest.call_api('ships')
        data.get.body.map { |k| SPACEX::Ships.new(k) }
      end

      def get(ship_id = nil)
        return retrieve_all if ship_id.nil?

        data = SPACEX::BaseRequest.get("ships/#{ship_id}")
        SPACEX::Ships.new(data)
      end

      def info(ship_id = nil)
        get(ship_id)
      end
    end
  end
end
