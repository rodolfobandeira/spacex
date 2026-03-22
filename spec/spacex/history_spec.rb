require 'spec_helper'

describe SPACEX::History do
  context '#info', vcr: { cassette_name: 'v4/history/all' } do
    subject { SPACEX::History.info }
    it 'returns an array of SPACEX::History' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::History
    end
  end

  context "#info('5f6fb2cfdcfdf403df37971e')",
          vcr: { cassette_name: 'v4/history/one' } do
    subject { SPACEX::History.info('5f6fb2cfdcfdf403df37971e') }

    it 'returns a specific history event with all properties' do
      expect(subject).to be_a SPACEX::History
      expect(subject.id).to eq '5f6fb2cfdcfdf403df37971e'
      expect(subject.title).to eq 'Falcon reaches Earth orbit'
      expect(subject.event_date_utc).to eq '2008-09-28T23:15:00Z'
      expect(subject.event_date_unix).to eq 1_222_643_700
      expect(subject.details).to include('Falcon 1')
      expect(subject.links).to be_a Hash
    end
  end
end
