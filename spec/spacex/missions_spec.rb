# frozen_string_literal: true

require 'spec_helper'

describe SPACEX do
  context 'Missions', vcr: { cassette_name: 'missions/info' } do
    subject do
      SPACEX::Missions.info
    end
    it 'returns missions info' do
      expect(subject.first.mission_id).to eq 'F3364BF'
      expect(subject.first.mission_name).to eq 'Iridium NEXT'
      expect(subject.first.manufacturers).to eq ['Orbital ATK']
      expect(subject.first.payload_ids).to eq ['Iridium NEXT 1', 'Iridium NEXT 2', 'Iridium NEXT 3', 'Iridium NEXT 4', 'Iridium NEXT 5', 'Iridium NEXT 6', 'Iridium NEXT 7']
      expect(subject.first.wikipedia).to eq 'https://en.wikipedia.org/wiki/Iridium_satellite_constellation'
      expect(subject.first.website).to eq 'https://www.iridiumnext.com/'
      expect(subject.first.twitter).to eq 'https://twitter.com/IridiumBoss?lang=en'
      expect(subject.first.description).to start_with 'In 2017, Iridium began launching Iridium NEXT'
    end
  end

  context 'Missions', vcr: { cassette_name: 'missions/F3364BF' } do
    subject do
      SPACEX::Missions.info('F3364BF')
    end
    it 'return specific mission info' do
      expect(subject.mission_id).to eq 'F3364BF'
      expect(subject.mission_name).to eq 'Iridium NEXT'
      expect(subject.manufacturers).to eq ['Orbital ATK']
      expect(subject.payload_ids).to eq ['Iridium NEXT 1', 'Iridium NEXT 2', 'Iridium NEXT 3', 'Iridium NEXT 4', 'Iridium NEXT 5', 'Iridium NEXT 6', 'Iridium NEXT 7']
      expect(subject.wikipedia).to eq 'https://en.wikipedia.org/wiki/Iridium_satellite_constellation'
      expect(subject.website).to eq 'https://www.iridiumnext.com/'
      expect(subject.twitter).to eq 'https://twitter.com/IridiumBoss?lang=en'
      expect(subject.description).to start_with 'In 2017, Iridium began launching Iridium NEXT, a second-generation worldwide network of telecommunications satellites, consisting of 66 active satellites, with another nine in-orbit spares and six on-ground spares.'
    end
  end
end
