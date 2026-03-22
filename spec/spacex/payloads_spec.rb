require 'spec_helper'

describe SPACEX::Payloads do
  context '#info', vcr: { cassette_name: 'v4/payloads/all' } do
    subject { SPACEX::Payloads.info }
    it 'returns an array of SPACEX::Payloads' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Payloads
    end
  end

  context "#info('5eb0e4b5b6c3bb0006eeb1e1')",
          vcr: { cassette_name: 'v4/payloads/one' } do
    subject { SPACEX::Payloads.info('5eb0e4b5b6c3bb0006eeb1e1') }

    it 'returns a specific payload with all properties' do
      expect(subject).to be_a SPACEX::Payloads
      expect(subject.id).to eq '5eb0e4b5b6c3bb0006eeb1e1'
      expect(subject.name).to eq 'FalconSAT-2'
      expect(subject.type).to eq 'Satellite'
      expect(subject.reused).to eq false
      expect(subject.launch).to eq '5eb87cd9ffd86e000604b32a'
      expect(subject.customers).to eq ['DARPA']
      expect(subject.norad_ids).to eq []
      expect(subject.nationalities).to eq ['United States']
      expect(subject.manufacturers).to eq ['SSTL']
      expect(subject.mass_kg).to eq 20
      expect(subject.mass_lbs).to eq 43
      expect(subject.orbit).to eq 'LEO'
      expect(subject.reference_system).to eq 'geocentric'
      expect(subject.regime).to eq 'low-earth'
      expect(subject.periapsis_km).to eq 400
      expect(subject.apoapsis_km).to eq 500
      expect(subject.inclination_deg).to eq 39
      expect(subject.dragon).to be_a Hash
    end
  end
end
