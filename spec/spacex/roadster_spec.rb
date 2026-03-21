require 'spec_helper'

describe SPACEX::Roadster do
  context '#info', vcr: { cassette_name: 'v4/roadster' } do
    subject { SPACEX::Roadster.info }

    it 'returns roadster info' do
      expect(subject.name).to eq "Elon Musk's Tesla Roadster"
      expect(subject.id).to eq '5eb75f0842fea42237d7f3f4'
    end
  end
end
