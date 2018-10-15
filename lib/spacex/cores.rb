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

    def self.info(core_serial = nil)
      SPACEX::BaseRequest.info("cores/#{core_serial}", SPACEX::Cores)
    end
  end
end
