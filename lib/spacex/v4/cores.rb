module SPACEX
  module V4
    class Cores < Hashie::Trash
      include Hashie::Extensions::IgnoreUndeclared

      property 'block'
      property 'reuse_count'
      property 'rtls_attempts'
      property 'rtls_landings'
      property 'asds_attempts'
      property 'asds_landings'
      property 'last_update'
      property 'launches'
      property 'serial'
      property 'id'

      def self.info(core_id = nil)
        SPACEX::BaseRequest.info("cores/#{core_id}", SPACEX::V4::Cores, 'v4')
      end
    end
  end
end
