require 'spec_helper'

describe SPACEX::Company do
  context '#info', vcr: { cassette_name: 'v4/company' } do
    subject { SPACEX::Company.info }

    it 'returns company info as a Response' do
      expect(subject.name).to eq 'SpaceX'
      expect(subject.founder).to eq 'Elon Musk'
      expect(subject.founded).to eq 2002
      expect(subject.employees).to eq 9500
      expect(subject.vehicles).to eq 4
      expect(subject.launch_sites).to eq 3
      expect(subject.test_sites).to eq 3
      expect(subject.ceo).to eq 'Elon Musk'
      expect(subject.cto).to eq 'Elon Musk'
      expect(subject.coo).to eq 'Gwynne Shotwell'
      expect(subject.cto_propulsion).to eq 'Tom Mueller'
      expect(subject.valuation).to eq 74_000_000_000
      expect(subject.headquarters.address).to eq 'Rocket Road'
      expect(subject.headquarters.city).to eq 'Hawthorne'
      expect(subject.headquarters.state).to eq 'California'
      expect(subject.id).to eq '5eb75edc42fea42237d7f3ed'
    end
  end
end
