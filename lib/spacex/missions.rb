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
      def info(mission_id = nil)
        get(mission_id)
      end

      private

      def retrieve_all
        data = SPACEX::BaseRequest.call_api('missions')
        data.get.body.map { |k| SPACEX::Missions.new(k) }
      end

      def get(mission_id = nil)
        return retrieve_all if mission_id.nil?

        data = SPACEX::BaseRequest.get("missions/#{mission_id}")
        SPACEX::Missions.new(data)
      end
    end
  end
end
