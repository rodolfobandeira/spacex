require 'spec_helper'

describe SPACEX::Landpads do
  context '#info', vcr: { cassette_name: 'v4/landpads/all' } do
    subject { SPACEX::Landpads.info }
    it 'returns an array of SPACEX::Landpads' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Landpads
    end
  end

  context "#info('5e9e3032383ecb267a34e7c7')",
          vcr: { cassette_name: 'v4/landpads/one' } do
    subject { SPACEX::Landpads.info('5e9e3032383ecb267a34e7c7') }

    it 'returns a specific landpad with all properties' do
      expect(subject).to be_a SPACEX::Landpads
      expect(subject.id).to eq '5e9e3032383ecb267a34e7c7'
      expect(subject.name).to eq 'LZ-1'
      expect(subject.full_name).to eq 'Landing Zone 1'
      expect(subject.status).to eq 'active'
      expect(subject.type).to eq 'RTLS'
      expect(subject.locality).to eq 'Cape Canaveral'
      expect(subject.region).to eq 'Florida'
      expect(subject.latitude).to eq 28.485833
      expect(subject.longitude).to eq(-80.544444)
      expect(subject.landing_attempts).to eq 21
      expect(subject.landing_successes).to eq 20
      expect(subject.wikipedia).to eq 'https://en.wikipedia.org/wiki/Landing_Zones_1_and_2'
      expect(subject.details).not_to be_nil
      expect(subject.launches).to be_an Array
      expect(subject.images).to be_a Hash
    end
  end
end
