require 'spec_helper'

describe SPACEX::Dragons do
  context '#info', vcr: { cassette_name: 'v4/dragons/all' } do
    subject { SPACEX::Dragons.info }
    it 'returns an array of SPACEX::Dragons' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a SPACEX::Dragons
    end
  end

  context "#info('5e9d058759b1ff74a7ad5f8f')",
          vcr: { cassette_name: 'v4/dragons/one' } do
    subject { SPACEX::Dragons.info('5e9d058759b1ff74a7ad5f8f') }

    it 'returns a specific dragon with all properties' do
      expect(subject).to be_a SPACEX::Dragons
      expect(subject.id).to eq '5e9d058759b1ff74a7ad5f8f'
      expect(subject.name).to eq 'Dragon 1'
      expect(subject.type).to eq 'capsule'
      expect(subject.active).to eq true
      expect(subject.crew_capacity).to eq 0
      expect(subject.sidewall_angle_deg).to eq 15
      expect(subject.orbit_duration_yr).to eq 2
      expect(subject.dry_mass_kg).to eq 4200
      expect(subject.dry_mass_lb).to eq 9300
      expect(subject.first_flight).to eq '2010-12-08'
      expect(subject.wikipedia).to eq 'https://en.wikipedia.org/wiki/SpaceX_Dragon'
      expect(subject.description).not_to be_nil
      expect(subject.heat_shield).to be_a Hash
      expect(subject.launch_payload_mass).to be_a Hash
      expect(subject.return_payload_mass).to be_a Hash
      expect(subject.diameter).to be_a Hash
      expect(subject.height_w_trunk).to be_a Hash
      expect(subject.thrusters).to be_an Array
      expect(subject.flickr_images).to be_an Array
    end
  end
end
