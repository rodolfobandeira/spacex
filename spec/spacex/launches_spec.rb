require 'spec_helper'

describe SPACEX::Launches do
  context '#info', vcr: { cassette_name: 'v4/launches/all' } do
    subject { SPACEX::Launches.info }
    it 'returns an array of SPACEX::Launches' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Launches
    end
  end

  context "#info('5eb87cd9ffd86e000604b32a')",
          vcr: { cassette_name: 'v4/launches/one' } do
    subject { SPACEX::Launches.info('5eb87cd9ffd86e000604b32a') }
    it 'returns a specific launch' do
      expect(subject).to be_a SPACEX::Launches
      expect(subject.id).to eq '5eb87cd9ffd86e000604b32a'
      expect(subject.name).not_to be_nil
    end
  end

  context '#latest', vcr: { cassette_name: 'v4/launches/latest' } do
    subject { SPACEX::Launches.latest }
    it 'returns a SPACEX::Launches object' do
      expect(subject).to be_a SPACEX::Launches
    end
  end

  context '#next', vcr: { cassette_name: 'v4/launches/next' } do
    subject { SPACEX::Launches.next }
    it 'returns a SPACEX::Launches object' do
      expect(subject).to be_a SPACEX::Launches
    end
  end

  context '#past', vcr: { cassette_name: 'v4/launches/past' } do
    subject { SPACEX::Launches.past }
    it 'returns an array of SPACEX::Launches' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Launches
    end
  end

  context '#upcoming', vcr: { cassette_name: 'v4/launches/upcoming' } do
    subject { SPACEX::Launches.upcoming }
    it 'returns an array of SPACEX::Launches' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Launches
    end
  end
end
