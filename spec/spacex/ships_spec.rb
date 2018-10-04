# frozen_string_literal: true

require 'spec_helper'

describe SPACEX do
  context 'Ships', vcr: { cassette_name: 'ships/info' } do
    subject do
      SPACEX::Ships.info(1)
    end
    it 'returns Ships info' do
      expect(subject.ship_id).to eq 'AMERICANCHAMPION'
      expect(subject.ship_name).to eq 'American Champion'
      expect(subject.ship_model).to eq nil
      expect(subject.ship_type).to eq 'Tug'
      expect(subject.active).to eq false
      expect(subject['imo']).to eq 7_434_016
      expect(subject.mmsi).to eq 367_020_820
      expect(subject.abs).to eq 571_252
      expect(subject['class']).to eq 7_604_342
      expect(subject.weight_lbs).to eq 588_000
      expect(subject.weight_kg).to eq 266_712
      expect(subject.year_built).to eq 1976
      expect(subject.home_port).to eq 'Port of Los Angeles'
      expect(subject.status).to eq 'Stopped'
      expect(subject.speed_kn).to eq 0
      expect(subject.course_deg).to eq nil
      expect(subject.successful_landings).to eq nil
      expect(subject.attempted_landings).to eq nil
      expect(subject.url).to eq 'https://www.marinetraffic.com/en/ais/details/ships/shipid:434663/vessel:AMERICAN%20CHAMPION'
      expect(subject.image).to eq 'https://i.imgur.com/woCxpkj.jpg'
    end
  end
end