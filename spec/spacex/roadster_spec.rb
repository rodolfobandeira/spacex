# frozen_string_literal: true

require 'spec_helper'

describe SPACEX do
  context 'Roadster Information', vcr: { cassette_name: 'roadster/info' } do
    subject do
      SPACEX::Roadster.info
    end
    it 'returns Roadster launch info' do
      expect(subject.name).to eq "Elon Musk's Tesla Roadster"
      expect(subject.launch_date_utc).to eq '2018-02-06T20:45:00.000Z'
      expect(subject.launch_date_unix).to eq 1_517_949_900
      expect(subject.launch_date_kg).to eq nil
      expect(subject.launch_date_lbs).to eq nil
      expect(subject.norad_id).to eq 43_205
      expect(subject.epoch_jd).to eq 2_458_353.027800926
      expect(subject.orbit_type).to eq 'heliocentric'
      expect(subject.apoapsis_au).to eq 1.663757412460597
      expect(subject.periapsis_au).to eq 0.9860953641129515
      expect(subject.semo_major_axis_au).to eq nil
      expect(subject.eccentricity).to eq 0.2557357353354217
      expect(subject.inclination).to eq 1.077474057737451
      expect(subject.longitude).to eq 317.0962040947829
      expect(subject.periapsis_arg).to eq 177.491390597234
      expect(subject.speed_kph).to eq 76_703.72399999999
      expect(subject.speed_mph).to eq 47_661.469685603995
      expect(subject.earth_distance_km).to eq 172_954_806.23899576
      expect(subject.earth_distance_mi).to eq 107_469_100.90753104
      expect(subject.mars_distance_km).to eq 147_648_108.6344399
      expect(subject.mars_distance_mi).to eq 91_744_252.91029055
      expect(subject.wikipedia).to eq 'https://en.wikipedia.org/wiki/Elon_Musk%27s_Tesla_Roadster'
      expect(subject.details).to eq "Elon Musk's Tesla Roadster is an electric sports car that served as the dummy payload for the February 2018 Falcon Heavy test flight and is now an artificial satellite of the Sun. Starman, a mannequin dressed in a spacesuit, occupies the driver's seat. The car and rocket are products of Tesla and SpaceX, both companies founded by Elon Musk. This 2008-model Roadster was previously used by Musk for commuting, and is the only consumer car sent into space."
    end
  end
end
