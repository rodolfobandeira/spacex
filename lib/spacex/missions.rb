module SPACEX
  class Missions < Hashie::Trash
    include Hashie::Extensions::IgnoreUndeclared

    property 'mission_id'
    property 'mission_name'
    property 'manufacturers'
    property 'payload_ids'
    property 'wikipedia'
    property 'website'
    property 'twitter'
    property 'description'

    def self.info(mission_id = nil)
      SPACEX::BaseRequest.info("missions/#{mission_id}", SPACEX::Missions)
    end
  end
end
