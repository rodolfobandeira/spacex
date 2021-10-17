require 'spec_helper'

describe SPACEX::V4::Cores do
  context '#info', vcr: { cassette_name: 'v4/cores' } do
    subject do
      SPACEX::V4::Cores.info
    end
    it 'returns an array of core hashes,
      each with the specified list of keys' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a Hash
      subject.all? do |core|
        expect(core.keys).to contain_exactly(
          'block',
          'reuse_count',
          'rtls_attempts',
          'rtls_landings',
          'asds_attempts',
          'asds_landings',
          'last_update',
          'launches',
          'serial',
          'id',
          'status'
        )
      end
    end
  end

  context "#info('60b800111f83cc1e59f16438')",
          vcr: { cassette_name: 'v4/cores/60b800111f83cc1e59f16438' } do
    subject do
      SPACEX::V4::Cores.info('60b800111f83cc1e59f16438')
    end
    it 'return specific core details' do
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
      expect(subject.id).to eq '60b800111f83cc1e59f16438'
    end
  end
end
