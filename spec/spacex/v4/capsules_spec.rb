require 'spec_helper'

describe SPACEX::V4::Capsules do
  context '#info', vcr: { cassette_name: 'v4/capsules' } do
    subject do
      SPACEX::V4::Capsules.info
    end
    it 'returns an array of capsule hashes,
      each with the specified list of keys' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a Hash
      subject.all? do |capsule|
        expect(capsule.keys).to contain_exactly(
          'id',
          'land_landings',
          'last_update',
          'launches',
          'reuse_count',
          'serial',
          'status',
          'type',
          'water_landings'
        )
      end
    end
  end

  context "#info('5e9e2c5bf35918ed873b2664')",
    vcr: { cassette_name: 'v4/capsules/5e9e2c5bf35918ed873b2664' } do
    subject do
      SPACEX::V4::Capsules.info('5e9e2c5bf35918ed873b2664')
    end
    it 'return specific capsule details' do
      expect(subject.id).to eq '5e9e2c5bf35918ed873b2664'
      expect(subject.land_landings).to eq 0
      expect(subject.last_update).to eq 'Reentered after three weeks in orbit'
      expect(subject.launches).to be_an Array
      expect(subject.reuse_count).to eq 1
      expect(subject.serial).to eq 'C101'
      expect(subject.status).to eq 'retired'
      expect(subject.type).to eq 'Dragon 1.0'
      expect(subject.water_landings).to eq 1
    end
  end
end
