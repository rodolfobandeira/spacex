require 'spec_helper'

describe SPACEX::Capsules do
  context '#info', vcr: { cassette_name: 'capsules' } do
    subject do
      SPACEX::Capsules.info
    end
    it 'returns an array of capsules ' do
      expect(subject).to be_an Array
      expect(subject.first.capsule_serial).to eq 'C201'
      expect(subject.first.capsule_id).to eq 'dragon2'
      expect(subject.first.status).to eq 'active'
      expect(subject.first.original_launch).to eq nil
      expect(subject.first.original_launch_unix).to eq nil
      expect(subject.first.missions).to be_an(Array)
      expect(subject.first.landings).to eq 0
      expect(subject.first.type).to eq 'Dragon 2.0'
      expect(subject.first.details).to start_with 'Pressure vessel used for Dragon 2 structural testing.'
    end
  end

  context "#info('C202')", vcr: { cassette_name: 'capsules/C202' } do
    subject do
      SPACEX::Capsules.info('C202')
    end
    it 'return specific capsule details' do
      expect(subject.capsule_serial).to eq 'C202'
      expect(subject.capsule_id).to eq 'dragon2'
      expect(subject.status).to eq 'active'
      expect(subject.original_launch).to eq nil
      expect(subject.original_launch_unix).to eq nil
      expect(subject.missions).to be_an(Array)
      expect(subject.landings).to eq 0
      expect(subject.type).to eq 'Dragon 2.0'
      expect(subject.details).to start_with "Capsule used to qualify Dragon 2's environmental control and life support systems."
    end
  end
end
