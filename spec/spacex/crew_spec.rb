require 'spec_helper'

describe SPACEX::Crew do
  context '#info', vcr: { cassette_name: 'v4/crew/all' } do
    subject { SPACEX::Crew.info }

    it 'returns an array of SPACEX::Crew' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Crew
    end
  end

  context "#info('607a3ab45a906a44023e0872')",
          vcr: { cassette_name: 'v4/crew/one' } do
    subject { SPACEX::Crew.info('607a3ab45a906a44023e0872') }

    it 'returns specific crew member details' do
      expect(subject.agency).to eq 'SpaceX'
      expect(subject.id).to eq '607a3ab45a906a44023e0872'
      expect(subject.image).to eq 'https://imgur.com/ll7TlwD.png'
      expect(subject.launches).to eq ['607a37565a906a44023e0866']
      expect(subject.name).to eq 'Hayley Arceneaux'
      expect(subject.status).to eq 'active'
      expect(subject.wikipedia).to eq 'https://en.wikipedia.org/wiki/Hayley_Arceneaux'
    end
  end
end
