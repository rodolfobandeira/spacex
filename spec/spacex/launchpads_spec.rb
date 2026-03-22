require 'spec_helper'

describe SPACEX::Launchpads do
  context '#info', vcr: { cassette_name: 'v4/launchpads/all' } do
    subject { SPACEX::Launchpads.info }
    it 'returns an array of SPACEX::Launchpads' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Launchpads
    end
  end

  context "#info('5e9e4501f5090910d4566f83')",
          vcr: { cassette_name: 'v4/launchpads/one' } do
    subject { SPACEX::Launchpads.info('5e9e4501f5090910d4566f83') }

    it 'returns a specific launchpad with all properties' do
      expect(subject).to be_a SPACEX::Launchpads
      expect(subject.id).to eq '5e9e4501f5090910d4566f83'
      expect(subject.name).to eq 'VAFB SLC 3W'
      expect(subject.full_name).to eq 'Vandenberg Space Force Base Space Launch Complex 3W'
      expect(subject.locality).to eq 'Vandenberg Space Force Base'
      expect(subject.region).to eq 'California'
      expect(subject.latitude).to eq 34.6440904
      expect(subject.longitude).to eq(-120.5931438)
      expect(subject.launch_attempts).to eq 0
      expect(subject.launch_successes).to eq 0
      expect(subject.rockets).to be_an Array
      expect(subject.timezone).to eq 'America/Los_Angeles'
      expect(subject.launches).to be_an Array
      expect(subject.status).to eq 'retired'
      expect(subject.details).not_to be_nil
    end
  end
end
