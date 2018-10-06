# frozen_string_literal: true

require 'spec_helper'

describe SPACEX do
  context 'Missions', vcr: { cassette_name: 'missions/info' } do
    subject do
      SPACEX::Missions.retrieve_all
    end
    it 'returns missions info' do
      expect(subject[0]['mission_name']).to eq 'Iridium NEXT'
      expect(subject[0]['mission_id']).to eq 'F3364BF'
      expect(subject[0]['manufacturers']).to eq ['Orbital ATK']
      expect(subject[0]['payload_ids']).to eq ['Iridium NEXT 1', 'Iridium NEXT 2', 'Iridium NEXT 3', 'Iridium NEXT 4', 'Iridium NEXT 5', 'Iridium NEXT 6', 'Iridium NEXT 7']
      expect(subject[0]['wikipedia']).to eq 'https://en.wikipedia.org/wiki/Iridium_satellite_constellation'
      expect(subject[0]['website']).to eq 'https://www.iridiumnext.com/'
      expect(subject[0]['twitter']).to eq 'https://twitter.com/IridiumBoss?lang=en'
      expect(subject[0]['description']).to start_with 'In 2017, Iridium began launching Iridium NEXT, a second-generation worldwide network of telecommunications satellites, consisting of 66 active satellites, with another nine in-orbit spares and six on-ground spares.'
    end
  end
end
