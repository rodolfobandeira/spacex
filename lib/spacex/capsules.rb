require_relative '../resource_service'

module SPACEX
  class Capsules < Hashie::Trash
    include Hashie::Extensions::IgnoreUndeclared

    property 'capsule_serial'
    property 'capsule_id'
    property 'status'
    property 'original_launch'
    property 'original_launch_unix'
    property 'missions'
    property 'landings'
    property 'type'
    property 'details'

    class << self
      include ResourceService

      def info(capsule_serial = nil)
        get(capsule_serial)
      end

      private

      def get(capsule_serial = nil)
        return retrieve_all('capsules') if capsule_serial.nil?

        data = SPACEX::BaseRequest.get("capsules/#{capsule_serial}")
        SPACEX::Capsules.new(data)
      end
    end
  end
end
