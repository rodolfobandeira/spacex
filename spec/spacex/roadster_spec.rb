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
      expect(subject.epoch_jd).to eq 2_458_402.62119213
      expect(subject.orbit_type).to eq 'heliocentric'
      expect(subject.apoapsis_au).to eq 1.663745482126572
      expect(subject.periapsis_au).to eq 0.9860262071518
      expect(subject.semo_major_axis_au).to eq nil
      expect(subject.eccentricity).to eq 0.2557651580764452
      expect(subject.inclination).to eq 1.077526460239241
      expect(subject.longitude).to eq 317.0949151781638
      expect(subject.periapsis_arg).to eq 177.4877172683911
      expect(subject.speed_kph).to eq 72_400.356
      expect(subject.speed_mph).to eq 44_987.481608076
      expect(subject.earth_distance_km).to eq 252_583_722.357282
      expect(subject.earth_distance_mi).to eq 156_948_200.14486668
      expect(subject.mars_distance_km).to eq 191_564_175.5833636
      expect(subject.mars_distance_mi).to eq 119_032_423.34641021
      expect(subject.wikipedia).to eq 'https://en.wikipedia.org/wiki/Elon_Musk%27s_Tesla_Roadster'
      expect(subject.details).to eq "Elon Musk's Tesla Roadster is an electric sports car that served as the dummy payload for the February 2018 Falcon Heavy test flight and is now an artificial satellite of the Sun. Starman, a mannequin dressed in a spacesuit, occupies the driver's seat. The car and rocket are products of Tesla and SpaceX, both companies founded by Elon Musk. This 2008-model Roadster was previously used by Musk for commuting, and is the only consumer car sent into space."
    end
  end
end
