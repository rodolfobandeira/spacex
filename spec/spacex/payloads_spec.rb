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
end
