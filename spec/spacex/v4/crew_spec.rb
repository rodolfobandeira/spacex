require 'spec_helper'

describe SPACEX::V4::Crew do
  context '#info', vcr: { cassette_name: 'v4/crew' } do
    subject do
      SPACEX::V4::Crew.info
    end
    it 'returns an array of crew hashes,
      each with the specified list of keys' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a Hash
      subject.all? do |rocket|
        expect(rocket.keys).to contain_exactly(
          'agency',
          'id',
          'image',
          'launches',
          'name',
          'status',
          'wikipedia'
        )
      end
    end
  end

  context "#info('607a3ab45a906a44023e0872')",
          vcr: { cassette_name: 'v4/crew/607a3ab45a906a44023e0872' } do
    subject do
      SPACEX::V4::Crew.info('607a3ab45a906a44023e0872')
    end
    it 'return specific crew member details' do
      expect(subject.agency).to eq 'SpaceX'
      expect(subject.id).to eq '607a3ab45a906a44023e0872'
      expect(subject.image).to eq 'https://imgur.com/ll7TlwD.png'
      expect(subject.launches).to eq (
        ['607a37565a906a44023e0866']
      )
      expect(subject.name).to eq 'Hayley Arceneaux'
      expect(subject.status).to eq 'active'
      expect(subject.wikipedia).to eq (
        'https://en.wikipedia.org/wiki/Hayley_Arceneaux'
      )
    end
  end
end
