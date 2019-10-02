require 'spec_helper'

describe SPACEX::LandingPads do
  context '#info', vcr: { cassette_name: 'landing_pads/info' } do
    subject do
      SPACEX::LandingPads.info
    end

    it "returns all LandingPads' info when no id is passed" do
      first_subject = subject.first

      expect(subject.class).to eq Array
      expect(first_subject.id).to eq 'LZ-1'
      expect(first_subject.full_name).to eq 'Landing Zone 1'
      expect(first_subject.status).to eq 'active'
      expect(first_subject.location).to eq(
        'name' => 'Cape Canaveral',
        'region' => 'Florida',
        'latitude' => 28.485833,
        'longitude' => -80.544444
      )
      expect(first_subject.landing_type).to eq 'RTLS'
      expect(first_subject.attempted_landings).to eq 14
      expect(first_subject.successful_landings).to eq 13
      expect(first_subject.wikipedia).to eq(
        'https://en.wikipedia.org/wiki/Landing_Zones_1_and_2'
      )
      expect(first_subject.details).to eq(
        "SpaceX's first east coast landing pad is Landing Zone 1, " \
        'where the historic first Falcon 9 landing occurred in December 2015.' \
        ' LC-13 was originally used as a launch pad for early Atlas missiles ' \
        'and rockets from Lockheed Martin. LC-1 was later expanded to ' \
        'include Landing Zone 2 for side booster RTLS Falcon Heavy missions, ' \
        'and it was first used in February 2018 for that purpose.'
      )
    end
  end

  context "#info('LZ-4')", vcr: { cassette_name: 'landing_pads/info/LZ-4' } do
    subject do
      SPACEX::LandingPads.info('LZ-4')
    end

    it 'returns LandingPad info for "LZ-4"' do
      expect(subject.class).to eq SPACEX::Response
      expect(subject.id).to eq 'LZ-4'
      expect(subject.full_name).to eq 'Landing Zone 4'
      expect(subject.status).to eq 'active'
      expect(subject.location).to eq(
        'name' => 'Vandenberg Air Force Base',
        'region' => 'California',
        'latitude' => 34.632989,
        'longitude' => -120.615167
      )
      expect(subject.landing_type).to eq 'RTLS'
      expect(subject.attempted_landings).to eq 2
      expect(subject.successful_landings).to eq 2
      expect(subject.wikipedia).to eq(
        'https://en.wikipedia.org/wiki/' \
          'Vandenberg_AFB_Space_Launch_Complex_4#LZ-4_landing_history'
      )
      expect(subject.details).to eq(
        "SpaceX's west coast landing pad. The pad is adjacent to SLC-4E, " \
        "SpaceX's west coast launch site. The pad was under construction for " \
        'about a year starting in 2016. ' \
        'After concerns with seal mating season, this pad was first used for ' \
        'the SAOCOM 1A mission in October 2018. ' \
        'Officially referred to as LZ-4 in FCC filings.'
      )
    end
  end
end
