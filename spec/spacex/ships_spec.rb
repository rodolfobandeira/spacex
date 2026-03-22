require 'spec_helper'

describe SPACEX::Ships do
  context '#info', vcr: { cassette_name: 'v4/ships/all' } do
    subject { SPACEX::Ships.info }
    it 'returns an array of SPACEX::Ships' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Ships
    end
  end

  context "#info('5ea6ed2d080df4000697c901')",
          vcr: { cassette_name: 'v4/ships/one' } do
    subject { SPACEX::Ships.info('5ea6ed2d080df4000697c901') }

    it 'returns a specific ship with all properties' do
      expect(subject).to be_a SPACEX::Ships
      expect(subject.id).to eq '5ea6ed2d080df4000697c901'
      expect(subject.name).to eq 'American Champion'
      expect(subject.legacy_id).to eq 'AMERICANCHAMPION'
      expect(subject.type).to eq 'Tug'
      expect(subject.roles).to be_an Array
      expect(subject.imo).to eq 7_434_016
      expect(subject.mmsi).to eq 367_020_820
      expect(subject.abs).to eq 571_252
      expect(subject.mass_kg).to eq 266_712
      expect(subject.mass_lbs).to eq 588_000
      expect(subject.year_built).to eq 1976
      expect(subject.home_port).to eq 'Port of Los Angeles'
      expect(subject.active).to eq false
      expect(subject.launches).to be_an Array
    end
  end
end
