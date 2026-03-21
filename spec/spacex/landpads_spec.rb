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
    it 'returns a specific landpad' do
      expect(subject).to be_a SPACEX::Landpads
      expect(subject.id).to eq '5e9e3032383ecb267a34e7c7'
      expect(subject.name).not_to be_nil
    end
  end
end
