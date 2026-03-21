require 'spec_helper'

describe SPACEX::Rockets do
  context '#info', vcr: { cassette_name: 'v4/rockets/all' } do
    subject { SPACEX::Rockets.info }

    it 'returns an array of SPACEX::Rockets' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Rockets
    end
  end

  context "#info('5e9d0d95eda69955f709d1eb')",
          vcr: { cassette_name: 'v4/rockets/one' } do
    subject { SPACEX::Rockets.info('5e9d0d95eda69955f709d1eb') }

    it 'returns specific rocket details' do
      expect(subject.active).to eq false
      expect(subject.boosters).to eq 0
      expect(subject.company).to eq 'SpaceX'
      expect(subject.cost_per_launch).to eq 6_700_000
      expect(subject.country).to eq 'Republic of the Marshall Islands'
      expect(subject.id).to eq '5e9d0d95eda69955f709d1eb'
      expect(subject.name).to eq 'Falcon 1'
      expect(subject.stages).to eq 2
      expect(subject.success_rate_pct).to eq 40
      expect(subject.type).to eq 'rocket'
      expect(subject.wikipedia).to eq 'https://en.wikipedia.org/wiki/Falcon_1'
      expect(subject.first_flight).to eq '2006-03-24'
      expect(subject.flickr_images).to be_an Array
      expect(subject.engines).to be_a Hash
      expect(subject.height).to be_a Hash
      expect(subject.mass).to be_a Hash
    end
  end
end
