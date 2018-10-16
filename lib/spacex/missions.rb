require_relative '../resource_service'

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

    class << self
      include ResourceService

      def info(mission_id = nil)
        get(mission_id)
      end

      private

      def get(mission_id = nil)
        return retrieve_all('missions') if mission_id.nil?

        data = SPACEX::BaseRequest.get("missions/#{mission_id}")
        SPACEX::Missions.new(data)
      end
    end
  end
end
