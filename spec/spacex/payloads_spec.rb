require 'spec_helper'

describe SPACEX::Payloads do
  context '#info', vcr: { cassette_name: 'payloads/info' } do
    subject do
      SPACEX::Payloads.info
    end
    it 'returns payloads info' do
      expect(subject.first.payload_id).to eq 'FalconSAT-2'
      expect(subject.first.reused).to eq false
      expect(subject.first.customers).to eq ['DARPA']
      expect(subject.first.nationality).to eq 'United States'
      expect(subject.first.manufacturer).to eq 'SSTL'
      expect(subject.first.payload_type).to eq 'Satellite'
      expect(subject.first.payload_mass_kg).to eq 20
      expect(subject.first.payload_mass_lbs).to eq 43
      expect(subject.first.orbit).to eq 'LEO'
      expect(subject.first.orbit_params.reference_system).to eq 'geocentric'
      expect(subject.first.orbit_params.regime).to eq 'low-earth'
      expect(subject.first.orbit_params.longitude).to eq nil
      expect(subject.first.orbit_params.semi_major_axis_km).to eq nil
      expect(subject.first.orbit_params.eccentricity).to eq nil
      expect(subject.first.orbit_params.periapsis_km).to eq 400
      expect(subject.first.orbit_params.apoapsis_km).to eq 500
      expect(subject.first.orbit_params.inclination_deg).to eq 39
      expect(subject.first.orbit_params.period_min).to eq nil
      expect(subject.first.orbit_params.lifespan_years).to eq nil
    end
  end

  context "#info('RatSat')", vcr: { cassette_name: 'payloads/RatSat' } do
    subject do
      SPACEX::Payloads.info('RatSat')
    end
    it 'return specific payload info' do
      expect(subject.payload_id).to eq 'RatSat'
      expect(subject.reused).to eq false
      expect(subject.customers).to eq ['SpaceX']
      expect(subject.nationality).to eq 'United States'
      expect(subject.manufacturer).to eq 'SpaceX'
      expect(subject.payload_type).to eq 'Satellite'
      expect(subject.payload_mass_kg).to eq 165
      expect(subject.payload_mass_lbs).to eq 363
      expect(subject.orbit).to eq 'LEO'      
      expect(subject.orbit_params.apoapsis_km).to eq 638.145
      expect(subject.orbit_params.arg_of_pericenter).to eq 262.0542
      expect(subject.orbit_params.eccentricity).to eq 0.0009194
      expect(subject.orbit_params.epoch).to eq "2008-09-28T22:51:02.000Z"
      expect(subject.orbit_params.inclination_deg).to eq 9.3329 
      expect(subject.orbit_params.lifespan_years).to eq nil 
      expect(subject.orbit_params.longitude).to eq nil 
      expect(subject.orbit_params.mean_anomaly).to eq 98.2248 
      expect(subject.orbit_params.mean_motion).to eq 14.79249332 
      expect(subject.orbit_params.periapsis_km).to eq 625.256 
      expect(subject.orbit_params.period_min).to eq 97.346 
      expect(subject.orbit_params.raan).to eq 63.3956 
      expect(subject.orbit_params.reference_system).to eq "geocentric" 
      expect(subject.orbit_params.regime).to eq "low-earth" 
      expect(subject.orbit_params.semi_major_axis_km).to eq 7009.836
    end
  end
end
