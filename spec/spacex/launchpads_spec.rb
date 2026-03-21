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
    it 'returns a specific launchpad' do
      expect(subject).to be_a SPACEX::Launchpads
      expect(subject.id).to eq '5e9e4501f5090910d4566f83'
      expect(subject.name).not_to be_nil
    end
  end
end
