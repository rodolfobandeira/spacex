require 'spec_helper'

describe SPACEX::LaunchPads do
  context '#info', vcr: { cassette_name: 'launch_pads/info' } do
    subject do
      SPACEX::LaunchPads.info
    end

    it "returns all LaunchPads' info when no id is passed" do
      first_subject = subject.first

      expect(subject.class).to eq Array
      expect(first_subject.id).to eq 5
      expect(first_subject.name).to eq 'VAFB SLC 3W'
      expect(first_subject.status).to eq 'retired'
      expect(first_subject.location).to eq(
        'name' => 'Vandenberg Air Force Base',
        'region' => 'California',
        'latitude' => 34.6440904,
        'longitude' => -120.5931438
      )
      expect(first_subject.vehicles_launched).to eq [
        'Falcon 1'
      ]
      expect(first_subject.attempted_launches).to eq 0
      expect(first_subject.successful_launches).to eq 0
      expect(first_subject.wikipedia).to eq(
        'https://en.wikipedia.org/wiki/Vandenberg_AFB_Space_Launch_Complex_3'
      )
      expect(first_subject.details).to eq 'SpaceX original ' \
                                          'west coast launch pad for Falcon 1. Performed a static fire but was ' \
                                          'never used for a launch and abandoned due to scheduling conflicts.'
      expect(first_subject.site_id).to eq 'vafb_slc_3w'
      expect(first_subject.site_name_long).to eq(
        'Vandenberg Air Force Base Space Launch Complex 3W'
      )
    end
  end

  context "#info('vafb_slc_4e')", vcr: {
    cassette_name: 'launch_pads/info/vafb_slc_4e'
  } do
    subject do
      SPACEX::LaunchPads.info('vafb_slc_4e')
    end

    it 'returns LaunchPad info for "vafb_slc_4e"' do
      expect(subject.class).to eq SPACEX::Response
      expect(subject.id).to eq 6
      expect(subject.name).to eq 'VAFB SLC 4E'
      expect(subject.status).to eq 'active'
      expect(subject.location).to eq(
        'name' => 'Vandenberg Air Force Base',
        'region' => 'California',
        'latitude' => 34.632093,
        'longitude' => -120.610829
      )
      expect(subject.vehicles_launched).to eq [
        'Falcon 9'
      ]
      expect(subject.attempted_launches).to eq 15
      expect(subject.successful_launches).to eq 15
      expect(subject.wikipedia).to eq(
        'https://en.wikipedia.org/wiki/Vandenberg_AFB_Space_Launch_Complex_4'
      )

      expect(subject.details).to eq 'SpaceX primary ' \
                                    'west coast launch pad for polar orbits and sun synchronous orbits, ' \
                                    'primarily used for Iridium. Also intended to be capable of ' \
                                    'launching Falcon Heavy.'
      expect(subject.site_id).to eq 'vafb_slc_4e'
      expect(subject.site_name_long).to eq(
        'Vandenberg Air Force Base Space Launch Complex 4E'
      )
    end
  end
end
