require 'spec_helper'

describe SPACEX::Cores do
  context '#info', vcr: { cassette_name: 'v4/cores/all' } do
    subject { SPACEX::Cores.info }

    it 'returns an array of SPACEX::Cores' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Cores
    end
  end

  context "#info('60b800111f83cc1e59f16438')",
          vcr: { cassette_name: 'v4/cores/one' } do
    subject { SPACEX::Cores.info('60b800111f83cc1e59f16438') }

    it 'returns specific core details' do
      expect(subject.block).to eq 5
      expect(subject.reuse_count).to eq 0
      expect(subject.rtls_attempts).to eq 0
      expect(subject.rtls_landings).to eq 0
      expect(subject.asds_attempts).to eq 1
      expect(subject.asds_landings).to eq 1
      expect(subject.last_update).to eq 'Landed on OCISLY* as of June 3, 2021 '
      expect(subject.launches).to be_an Array
      expect(subject.launches.first).to eq '5fe3af84b3467846b3242161'
      expect(subject.serial).to eq 'B1067'
      expect(subject.status).to eq 'unknown'
      expect(subject.id).to eq '60b800111f83cc1e59f16438'
    end
  end
end
