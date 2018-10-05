require 'spec_helper'

describe SPACEX do
  context 'Ships', vcr: { cassette_name: 'ships/info' } do
    subject do
      SPACEX::Ships.info
    end
    it 'returns Ships info' do
      expect(subject.first.ship_id).to eq 'AMERICANCHAMPION'
      expect(subject.first.ship_name).to eq 'American Champion'
      expect(subject.first.ship_model).to eq nil
      expect(subject.first.ship_type).to eq 'Tug'
      expect(subject.first.roles).to eq ['Support Ship', 'Barge Tug']
      expect(subject.first.active).to eq false
      expect(subject.first.imo).to eq 7_434_016
      expect(subject.first.mmsi).to eq 367_020_820
      expect(subject.first.abs).to eq 571_252
      expect(subject.first.ship_class).to eq 7_604_342 # Call as array since "class" is a method in Ruby
      expect(subject.first.weight_lbs).to eq 588_000
      expect(subject.first.weight_kg).to eq 266_712
      expect(subject.first.year_built).to eq 1976
      expect(subject.first.home_port).to eq 'Port of Los Angeles'
      expect(subject.first.status).to eq 'Stopped'
      expect(subject.first.speed_kn).to eq 0
      expect(subject.first.course_deg).to eq nil
      expect(subject.first.position).to eq ({ 'latitude' => 30.52852, 'longitude' => -88.09869 })
      expect(subject.first.successful_landings).to eq nil
      expect(subject.first.attempted_landings).to eq nil
      expect(subject.first.missions).to eq [{ 'flight' => 7, 'name' => 'COTS 1' }, { 'flight' => 8, 'name' => 'COTS 2' }]
      expect(subject.first.url).to eq 'https://www.marinetraffic.com/en/ais/details/ships/shipid:434663/vessel:AMERICAN%20CHAMPION'
      expect(subject.first.image).to eq 'https://i.imgur.com/woCxpkj.jpg'
    end
  end

  context 'Get specific Ship', vcr: { cassette_name: 'ships/info/AMERICANCHAMPION' } do
    subject do
      SPACEX::Ships.info('AMERICANCHAMPION')
    end
    it 'returns Ship info for "AMERICANCHAMPION"' do
      expect(subject.ship_id).to eq 'AMERICANCHAMPION'
      expect(subject.ship_name).to eq 'American Champion'
      expect(subject.ship_model).to eq nil
      expect(subject.ship_type).to eq 'Tug'
      expect(subject.roles).to eq ['Support Ship', 'Barge Tug']
      expect(subject.active).to eq false
      expect(subject.imo).to eq 7_434_016
      expect(subject.mmsi).to eq 367_020_820
      expect(subject.abs).to eq 571_252
      expect(subject.ship_class).to eq 7_604_342 # Call as array since "class" is a method in Ruby
      expect(subject.weight_lbs).to eq 588_000
      expect(subject.weight_kg).to eq 266_712
      expect(subject.year_built).to eq 1976
      expect(subject.home_port).to eq 'Port of Los Angeles'
      expect(subject.status).to eq 'Stopped'
      expect(subject.speed_kn).to eq 0
      expect(subject.course_deg).to eq nil
      expect(subject.position).to eq ({ 'latitude' => 30.52852, 'longitude' => -88.09869 })
      expect(subject.successful_landings).to eq nil
      expect(subject.attempted_landings).to eq nil
      expect(subject.missions).to eq [{ 'flight' => 7, 'name' => 'COTS 1' }, { 'flight' => 8, 'name' => 'COTS 2' }]
      expect(subject.url).to eq 'https://www.marinetraffic.com/en/ais/details/ships/shipid:434663/vessel:AMERICAN%20CHAMPION'
      expect(subject.image).to eq 'https://i.imgur.com/woCxpkj.jpg'
    end
  end
end
