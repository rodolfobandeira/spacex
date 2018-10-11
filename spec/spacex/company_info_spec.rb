require 'spec_helper'

describe SPACEX::CompanyInfo do
  context '#info', vcr: { cassette_name: 'company_info/info' } do
    subject do
      SPACEX::CompanyInfo.info
    end
    it 'returns company info' do
      expect(subject.name).to eq 'SpaceX'
      expect(subject.founder).to eq 'Elon Musk'
      expect(subject.founded).to eq 2002
      expect(subject.employees).to eq 7000
      expect(subject.vehicles).to eq 3
      expect(subject.launche_sites).to eq nil
      expect(subject.test_sites).to eq 1
      expect(subject.ceo).to eq 'Elon Musk'
      expect(subject.cto).to eq 'Elon Musk'
      expect(subject.coo).to eq 'Gwynne Shotwell'
      expect(subject.cto_propulsion).to eq 'Tom Mueller'
      expect(subject.valuation).to eq 27_500_000_000
      expect(subject.headquarters.address).to eq 'Rocket Road'
      expect(subject.headquarters.city).to eq 'Hawthorne'
      expect(subject.headquarters.state).to eq 'California'
      expect(subject.summary).to eq 'SpaceX designs, manufactures and launches advanced rockets and spacecraft. The company was founded in 2002 to revolutionize space technology, with the ultimate goal of enabling people to live on other planets.'
    end
  end
end
