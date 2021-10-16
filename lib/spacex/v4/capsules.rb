module SPACEX
  module V4
    class Capsules < Hashie::Trash
      include Hashie::Extensions::IgnoreUndeclared

      property 'id'
      property 'land_landings'
      property 'last_update'
      property 'launches'
      property 'reuse_count'
      property 'serial'
      property 'status'
      property 'type'
      property 'water_landings'

      def self.info(capsule_serial = nil, query = {})
        SPACEX::BaseRequest.info("capsules/#{capsule_serial}", SPACEX::V4::Capsules, 'v4')
      end
    end
  end
end
