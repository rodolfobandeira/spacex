require 'spec_helper'

describe SPACEX::Payloads do
  context '#info', vcr: { cassette_name: 'v4/payloads/all' } do
    subject { SPACEX::Payloads.info }
    it 'returns an array of SPACEX::Payloads' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Payloads
    end
  end

  context "#info('5eb0e4b5b6c3bb0006eeb1e1')",
          vcr: { cassette_name: 'v4/payloads/one' } do
    subject { SPACEX::Payloads.info('5eb0e4b5b6c3bb0006eeb1e1') }
    it 'returns a specific payload' do
      expect(subject).to be_a SPACEX::Payloads
      expect(subject.id).to eq '5eb0e4b5b6c3bb0006eeb1e1'
      expect(subject.name).not_to be_nil
    end
  end
end
