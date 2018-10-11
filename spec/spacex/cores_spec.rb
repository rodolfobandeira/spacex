# frozen_string_literal: true

require 'spec_helper'

describe SPACEX do
  context 'Cores', vcr: { cassette_name: 'cores' } do
    subject do
      SPACEX::Cores.info
    end
    it 'returns an array of cores ' do
      expect(subject).to be_an Array
      expect(subject.first.core_serial).to eq 'B1052'
      expect(subject.first.block).to eq 5
      expect(subject.first.status).to eq 'active'
      expect(subject.first.original_launch).to eq nil
      expect(subject.first.original_launch_unix).to eq nil
      expect(subject.first.missions).to be_an(Array)
      expect(subject.first.rtls_attempts).to eq 0
      expect(subject.first.rtls_landings).to eq 0
      expect(subject.first.asds_attempts).to eq 0
      expect(subject.first.asds_landings).to eq 0
      expect(subject.first.water_landing).to eq false
      expect(subject.first.details).to start_with 'On test stand at McGregor.'
    end
  end

  context 'Cores', vcr: { cassette_name: 'cores/B1041' } do
    subject do
      SPACEX::Cores.info('B1041')
    end
    it 'returns details of core' do
      expect(subject.core_serial).to eq 'B1041'
      expect(subject.block).to eq 4
      expect(subject.status).to eq 'expended'
      expect(subject.original_launch).to eq '2017-10-09T12:37:00.000Z'
      expect(subject.original_launch_unix).to eq 1_507_552_620
      expect(subject.missions[1]['name']).to eq 'Iridium NEXT Mission 5'
      expect(subject.missions[1]['flight']).to eq 58
      expect(subject.rtls_attempts).to eq 0
      expect(subject.rtls_landings).to eq 0
      expect(subject.asds_attempts).to eq 1
      expect(subject.asds_landings).to eq 1
      expect(subject.water_landing).to eq false
      expect(subject.details).to start_with 'Will fly expendable on Iridium NEXT Mission 5'
    end
  end
end
