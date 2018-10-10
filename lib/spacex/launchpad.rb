# frozen_string_literal: true

module SPACEX
  class Launchpad < Resource
    property 'id'
    property 'status'
    property 'location'
    property 'vehicles_launched'
    property 'details'
    property 'site_id'
    property 'site_name_long'

    def self.all
      response = SPACEX::BaseRequest.call_api('launchpads')
      response.get.body.map { |item| new(item) }
    end

    def self.get(site_id:)
      response = SPACEX::BaseRequest.get("launchpads/#{site_id}")
      new(response)
    end
  end
end
