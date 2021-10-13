require 'spec_helper'

describe SPACEX::V4::Company do
  context '#info', vcr: { cassette_name: 'v4/company' } do
    subject do
      SPACEX::V4::Company.info
    end
    it 'returns company info' do
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
      expect(subject.summary).to eq 'SpaceX designs, manufactures and launches advanced rockets and spacecraft. The company was founded in 2002 to revolutionize space technology, with the ultimate goal of enabling people to live on other planets.'
      expect(subject.links.website).to eq 'https://www.spacex.com/'
      expect(subject.links.flickr).to eq 'https://www.flickr.com/photos/spacex/'
      expect(subject.links.twitter).to eq 'https://twitter.com/SpaceX'
      expect(subject.links.elon_twitter).to eq 'https://twitter.com/elonmusk'
      expect(subject.id).to eq '5eb75edc42fea42237d7f3ed'
    end
  end
end
