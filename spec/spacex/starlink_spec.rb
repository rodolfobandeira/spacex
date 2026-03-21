require 'spec_helper'

describe SPACEX::Starlink do
  context '#info', vcr: { cassette_name: 'v4/starlink/all' } do
    subject { SPACEX::Starlink.info }
    it 'returns an array of SPACEX::Starlink' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Starlink
    end
  end

  context "#info('5eed770f096e59000698560d')",
          vcr: { cassette_name: 'v4/starlink/one' } do
    subject { SPACEX::Starlink.info('5eed770f096e59000698560d') }
    it 'returns a specific starlink satellite' do
      expect(subject).to be_a SPACEX::Starlink
      expect(subject.id).to eq '5eed770f096e59000698560d'
    end
  end
end
