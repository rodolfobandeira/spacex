# frozen_string_literal: true

require 'spec_helper'

describe SPACEX do
  context 'Capsule Information', vcr: { cassette_name: 'capsules/info' } do
    subject do
      SPACEX::Capsules.info(1)
    end
    it 'returns Capsules information index 1' do
      expect(subject.name).to eq "Dragon 1"
      expect(subject.type).to eq 'capsule'
      expect(subject.active).to eq true
      expect(subject.crew_capacity).to eq 0
      expect(subject.sidewall_angle_deg).to eq 15
      expect(subject.orbit_duration_yr).to eq 2
      expect(subject.dry_mass_kg).to eq 4200
      expect(subject.dry_mass_lb).to eq 9300
      expect(subject.first_flight).to eq "2010-12-08"
    end
  end
end