module SPACEX
  class Cores < Hashie::Trash
    include Hashie::Extensions::IgnoreUndeclared

    property 'core_serial'
    property 'block'
    property 'status'
    property 'original_launch'
    property 'original_launch_unix'
    property 'missions'
    property 'rtls_attempts'
    property 'rtls_landings'
    property 'asds_attempts'
    property 'asds_landings'
    property 'water_landing'
    property 'details'

    class << self
      def info(core_serial = nil)
        get(core_serial)
      end

      private

      def retrieve_all
        data = SPACEX::BaseRequest.call_api('cores')
        data.get.body.map { |k| SPACEX::Cores.new(k) }
      end

      def get(core_serial = nil)
        return retrieve_all if core_serial.nil?

        data = SPACEX::BaseRequest.get("cores/#{core_serial}")
        SPACEX::Cores.new(data)
      end
    end
  end
end
