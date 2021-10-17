module SPACEX
  module V4
    class Launches < Hashie::Trash
      include Hashie::Extensions::IgnoreUndeclared

      property 'id'
      property 'flight_number'
      property 'name'
      property 'date_utc'
      property 'date_unix'
      property 'date_local'
      property 'date_precision'
      property 'static_fire_date_utc'
      property 'static_fire_date_unix'
      property 'tbd'
      property 'net'
      property 'window'
      property 'rocket'
      property 'success'
      property 'failures'
      property 'upcoming'
      property 'details'
      property 'fairings'
      property 'crew'
      property 'ships'
      property 'capsules'
      property 'payloads'
      property 'launchpad'
      property 'cores'
      property 'links'
      property 'auto_update'

      def self.info(id = nil)
        SPACEX::BaseRequest.info("launches/#{id}", SPACEX::V4::Launches, 'v4')
      end

      def self.latest
        SPACEX::BaseRequest.info('launches/latest', SPACEX::V4::Launches, 'v4')
      end

      def self.next
        SPACEX::BaseRequest.info('launches/next', SPACEX::V4::Launches, 'v4')
      end

      def self.past
        SPACEX::BaseRequest.info('launches/past', SPACEX::V4::Launches, 'v4')
      end

      def self.upcoming
        SPACEX::BaseRequest.info('launches/upcoming', SPACEX::V4::Launches, 'v4')
      end

      def self.all
        info
      end
    end
  end
end
