module SPACEX
  class Cores < SPACEX::Resource
    property 'asds_attempts'
    property 'asds_landings'
    property 'block'
    property 'id'
    property 'last_update'
    property 'launches'
    property 'reuse_count'
    property 'rtls_attempts'
    property 'rtls_landings'
    property 'serial'
    property 'status'

    def self.info(id = nil)
      SPACEX::BaseRequest.info("cores/#{id}", SPACEX::Cores)
    end
  end
end
