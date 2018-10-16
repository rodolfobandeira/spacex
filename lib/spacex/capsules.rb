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

    def self.info(capsule_serial = nil)
      SPACEX::BaseRequest.info("capsules/#{capsule_serial}", SPACEX::Capsules)
    end
  end
end
