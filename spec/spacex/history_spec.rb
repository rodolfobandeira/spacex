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
    it 'returns a specific history event' do
      expect(subject).to be_a SPACEX::History
      expect(subject.id).to eq '5f6fb2cfdcfdf403df37971e'
      expect(subject.title).not_to be_nil
    end
  end
end
