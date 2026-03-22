module SPACEX
  class Payloads < SPACEX::Resource
    property 'apoapsis_km'
    property 'arg_of_pericenter'
    property 'customers'
    property 'dragon'
    property 'eccentricity'
    property 'epoch'
    property 'id'
    property 'inclination_deg'
    property 'launch'
    property 'lifespan_years'
    property 'longitude'
    property 'manufacturers'
    property 'mass_kg'
    property 'mass_lbs'
    property 'mean_anomaly'
    property 'mean_motion'
    property 'name'
    property 'nationalities'
    property 'norad_ids'
    property 'orbit'
    property 'periapsis_km'
    property 'period_min'
    property 'raan'
    property 'reference_system'
    property 'regime'
    property 'reused'
    property 'semi_major_axis_km'
    property 'type'

    def self.info(id = nil)
      SPACEX::BaseRequest.info("payloads/#{id}", SPACEX::Payloads)
    end
  end
end
