module SPACEX
  class Rockets < Hashie::Trash
    include Hashie::Extensions::IgnoreUndeclared

    property 'id'
    property 'active'
    property 'stages'
    property 'boosters'
    property 'cost_per_launch'
    property 'success_rate_pct'
    property 'first_flight'
    property 'country'
    property 'company'
    property 'height'
    property 'diameter'
    property 'mass'
    property 'payload_weights'
    property 'first_stage'
    property 'second_stage'
    property 'engines'
    property 'landing_legs'
    property 'wikipedia'
    property 'description'
    property 'rocket_id'
    property 'rocket_name'
    property 'rocket_type'

    class << self
      def info(rocket_id = nil)
        get(rocket_id)
      end

      private

      def retrieve_all
        data = SPACEX::BaseRequest.call_api('rockets')
        data.get.body.map { |k| SPACEX::Rockets.new(k) }
      end

      def get(rocket_id = nil)
        return retrieve_all if rocket_id.nil?

        data = SPACEX::BaseRequest.get("rockets/#{rocket_id}")
        SPACEX::Rockets.new(data)
      end
    end
  end
end
