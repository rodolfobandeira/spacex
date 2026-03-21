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
    it 'returns a specific ship' do
      expect(subject).to be_a SPACEX::Ships
      expect(subject.id).to eq '5ea6ed2d080df4000697c901'
      expect(subject.name).not_to be_nil
    end
  end
end
