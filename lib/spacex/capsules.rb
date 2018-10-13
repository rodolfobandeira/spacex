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
      def info(capsule_serial = nil)
        get(capsule_serial)
      end

      private

      def retrieve_all
        data = SPACEX::BaseRequest.call_api('capsules')
        data.get.body.map { |k| SPACEX::Capsules.new(k) }
      end

      def get(capsule_serial = nil)
        return retrieve_all if capsule_serial.nil?

        data = SPACEX::BaseRequest.get("capsules/#{capsule_serial}")
        SPACEX::Capsules.new(data)
      end
    end
  end
end
