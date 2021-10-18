require 'spec_helper'

describe SPACEX::V4::Starlink do
  context '#info', vcr: { cassette_name: 'v4/starlink' } do
    subject do
      SPACEX::V4::Starlink.info
    end

    it 'returns an array of starlink hashes, each with the specified list of keys' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a Hash
      subject.all? do |sat|
        expect(sat.keys).to contain_exactly(
          'id',
          'version',
          'launch',
          'longitude',
          'latitude',
          'height_km',
          'velocity_kms',
          'spaceTrack'
        )
      end
    end
  end

  context "#info('5eed7716096e590006985825')", vcr: { cassette_name: 'v4/starlink/5eed7716096e590006985825' } do
    subject do
      SPACEX::V4::Starlink.info('5eed7716096e590006985825')
    end
    it 'return specific starlink satellite details' do
      expect(subject.id).to eq '5eed7716096e590006985825'
      expect(subject.version).to eq 'v1.0'
      expect(subject.launch).to eq '5eb87d46ffd86e000604b389'
      expect(subject.longitude).to eq(-6.664657979647238)
      expect(subject.latitude).to eq 34.78016308849404
      expect(subject.height_km).to eq 548.8259541507387
      expect(subject.velocity_kms).to eq 7.592565007060266
      expect(subject.spaceTrack.CCSDS_OMM_VERS).to eq '2.0'
      expect(subject.spaceTrack.COMMENT).to eq 'GENERATED VIA SPACE-TRACK.ORG API'
      expect(subject.spaceTrack.CREATION_DATE).to eq '2021-10-17T02:25:50'
      expect(subject.spaceTrack.ORIGINATOR).to eq '18 SPCS'
      expect(subject.spaceTrack.OBJECT_NAME).to eq 'STARLINK-1506'
      expect(subject.spaceTrack.OBJECT_ID).to eq '2020-038T'
      expect(subject.spaceTrack.CENTER_NAME).to eq 'EARTH'
      expect(subject.spaceTrack.REF_FRAME).to eq 'TEME'
      expect(subject.spaceTrack.TIME_SYSTEM).to eq 'UTC'
      expect(subject.spaceTrack.MEAN_ELEMENT_THEORY).to eq 'SGP4'
      expect(subject.spaceTrack.EPOCH).to eq '2021-10-16T06:56:52.356768'
      expect(subject.spaceTrack.MEAN_MOTION).to eq 15.06385949
      expect(subject.spaceTrack.ECCENTRICITY).to eq 0.000155
      expect(subject.spaceTrack.INCLINATION).to eq 53.0543
      expect(subject.spaceTrack.RA_OF_ASC_NODE).to eq 243.5427
      expect(subject.spaceTrack.ARG_OF_PERICENTER).to eq 67.5595
      expect(subject.spaceTrack.MEAN_ANOMALY).to eq 292.5558
      expect(subject.spaceTrack.EPHEMERIS_TYPE).to eq 0
      expect(subject.spaceTrack.CLASSIFICATION_TYPE).to eq 'U'
      expect(subject.spaceTrack.NORAD_CAT_ID).to eq 45_747
      expect(subject.spaceTrack.ELEMENT_SET_NO).to eq 999
      expect(subject.spaceTrack.REV_AT_EPOCH).to eq 7422
      expect(subject.spaceTrack.BSTAR).to eq 3.7393e-05
      expect(subject.spaceTrack.MEAN_MOTION_DOT).to eq 2.75e-06
      expect(subject.spaceTrack.MEAN_MOTION_DDOT).to eq 0
      expect(subject.spaceTrack.SEMIMAJOR_AXIS).to eq 6925.392
      expect(subject.spaceTrack.PERIOD).to eq 95.593
      expect(subject.spaceTrack.APOAPSIS).to eq 548.33
      expect(subject.spaceTrack.PERIAPSIS).to eq 546.183
      expect(subject.spaceTrack.OBJECT_TYPE).to eq 'PAYLOAD'
      expect(subject.spaceTrack.RCS_SIZE).to eq 'LARGE'
      expect(subject.spaceTrack.COUNTRY_CODE).to eq 'US'
      expect(subject.spaceTrack.LAUNCH_DATE).to eq '2020-06-13'
      expect(subject.spaceTrack.SITE).to eq 'AFETR'
      expect(subject.spaceTrack.DECAY_DATE).to eq nil
      expect(subject.spaceTrack.DECAYED).to eq 0
      expect(subject.spaceTrack.FILE).to eq 3_166_610
      expect(subject.spaceTrack.GP_ID).to eq 187_355_518
      expect(subject.spaceTrack.TLE_LINE0).to eq '0 STARLINK-1506'
      expect(subject.spaceTrack.TLE_LINE1).to eq '1 45747U 20038T   21289.28949487  .00000275  00000-0  37393-4 0  9996'
      expect(subject.spaceTrack.TLE_LINE2).to eq '2 45747  53.0543 243.5427 0001550  67.5595 292.5558 15.06385949 74225'
    end
  end
end
