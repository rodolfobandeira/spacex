# frozen_string_literal: true

require 'spec_helper'

describe SPACEX do
  context 'Launchpad', vcr: { cassette_name: 'launchpads/retrieve_all' } do
    subject { SPACEX::Launchpad.info }

    it 'returns an array of Launchpads' do
      expect(subject).to be_an(Array)
      expect(subject.length).to eq(8)
      expect(subject.first).to be_a(SPACEX::Launchpad)
      expect(subject.first.id).to eq(1)
      expect(subject.first.status).to eq('retired')
      expect(subject.first.location).to be_a(Hash)
      expect(subject.first.vehicles_launched).to be_an(Array)
      expect(subject.first.details).to be_a(String)
      expect(subject.first.site_id).to eq('kwajalein_atoll')
      expect(subject.first.site_name_long).to eq('Kwajalein Atoll Omelek Island')
    end
  end

  context 'Launchpad', vcr: { cassette_name: 'launchpads/kwajalein_atoll' } do
    subject { SPACEX::Launchpad.info(example_launchpad_id) }

    let(:example_launchpad_id) { 'kwajalein_atoll' }

    it 'returns a specific Launchpad' do
      expect(subject).to be_a(SPACEX::Launchpad)
      expect(subject.id).to eq(1)
      expect(subject.status).to eq('retired')
      expect(subject.location).to be_a(Hash)
      expect(subject.vehicles_launched).to be_an(Array)
      expect(subject.details).to be_a(String)
      expect(subject.site_id).to eq('kwajalein_atoll')
      expect(subject.site_name_long).to eq('Kwajalein Atoll Omelek Island')
    end
  end
end
