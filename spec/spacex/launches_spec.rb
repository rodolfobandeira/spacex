require 'spec_helper'

describe SPACEX::Launches do
  context '#latest', vcr: { cassette_name: 'launches/latest' } do
    subject do
      SPACEX::Launches.latest
    end

    it 'returns latest launch' do
      expect(subject.flight_number).to eq 67
      expect(subject.mission_name).to eq 'Merah Putih'
      expect(subject.launch_year).to eq '2018'
      expect(subject.launch_date_unix).to eq 1_533_619_080
      expect(subject.launch_date_utc).to eq '2018-08-07T05:18:00.000Z'
      expect(subject.launch_date_local).to eq '2018-08-07T01:18:00-04:00'
      expect(subject.launch_success).to eq true
      expect(subject.rocket.rocket_id).to eq 'falcon9'
      expect(subject.rocket.rocket_name).to eq 'Falcon 9'
      expect(subject.rocket.rocket_type).to eq 'FT'
      expect(subject.rocket.first_stage.cores.first.core_serial).to eq 'B1046'
      expect(subject.rocket.first_stage.cores.first.flight).to eq 2
      expect(subject.rocket.first_stage.cores.first.block).to eq 5
      expect(subject.rocket.first_stage.cores.first.reused).to eq true
      expect(subject.rocket.first_stage.cores.first.land_success).to eq true
      expect(subject.rocket.first_stage.cores.first.landing_type).to eq 'ASDS'
      expect(subject.rocket.first_stage.cores.first.landing_vehicle).to eq 'OCISLY'
      expect(subject.rocket.second_stage.block).to eq 5
      expect(subject.rocket.second_stage.payloads.first.payload_id).to eq 'Telkom-4'
      expect(subject.rocket.second_stage.payloads.first.norad_id.first).to eq 43_587
      expect(subject.rocket.second_stage.payloads.first.reused).to eq false
      expect(subject.rocket.second_stage.payloads.first.customers.first).to eq 'Telkom'
      expect(subject.rocket.second_stage.payloads.first.nationality).to eq 'Indonesia'
      expect(subject.rocket.second_stage.payloads.first.manufacturer).to eq 'SSL'
      expect(subject.rocket.second_stage.payloads.first.payload_type).to eq 'Satellite'
      expect(subject.rocket.second_stage.payloads.first.payload_mass_kg).to eq 5800
      expect(subject.rocket.second_stage.payloads.first.payload_mass_lbs).to eq 12_786.81
      expect(subject.rocket.second_stage.payloads.first.orbit).to eq 'GTO'
      expect(subject.rocket.second_stage.payloads.first.orbit_params.regime).to eq 'geostationary'
      expect(subject.rocket.second_stage.payloads.first.orbit_params.longitude).to eq '-108'.to_i
      expect(subject.rocket.second_stage.payloads.first.orbit_params.semi_major_axis_km).to eq 21_226.178
      expect(subject.rocket.second_stage.payloads.first.orbit_params.eccentricity).to eq 0.6904141
      expect(subject.rocket.second_stage.payloads.first.orbit_params.periapsis_km).to eq 193.19
      expect(subject.rocket.second_stage.payloads.first.orbit_params.apoapsis_km).to eq 29_502.896
      expect(subject.rocket.second_stage.payloads.first.orbit_params.inclination_deg).to eq 27.0648
      expect(subject.rocket.second_stage.payloads.first.orbit_params.period_min).to eq 512.941
      expect(subject.rocket.second_stage.payloads.first.orbit_params.lifespan_years).to eq 15
      expect(subject.rocket.second_stage.payloads.first.orbit_params.epoch).to eq '2018-08-07T06:57:16.000Z'
      expect(subject.rocket.second_stage.payloads.first.orbit_params.mean_motion).to eq 2.80734018
      expect(subject.rocket.second_stage.payloads.first.orbit_params.raan).to eq 227.0228
      expect(subject.telemetry.flight_club).to eq nil
      expect(subject.reuse.core).to eq true
      expect(subject.reuse.sire_core1).to eq nil
      expect(subject.reuse.side_core2).to eq false
      expect(subject.reuse.fairings).to eq false
      expect(subject.reuse.capsule).to eq false
      expect(subject.launch_site.site_id).to eq 'ccafs_slc_40'
      expect(subject.launch_site.site_name).to eq 'CCAFS SLC 40'
      expect(subject.launch_site.site_name_long).to eq 'Cape Canaveral Air Force Station Space Launch Complex 40'
      expect(subject.launch_success).to eq true
      expect(subject.links.mission_patch).to eq 'https://images2.imgbox.com/a8/f5/ZgdsrbqW_o.png'
      expect(subject.links.mision_patch_small).to eq nil
      expect(subject.links.reddit_campaign).to eq 'https://www.reddit.com/r/spacex/comments/91gwfg/merah_putih_telkom4_launch_campaign_thread/'
      expect(subject.links.reddit_launch).to eq 'https://www.reddit.com/r/spacex/comments/9539nr/rspacex_merah_putih_telkom4_official_launch/'
      expect(subject.links.reddit_recovery).to eq nil
      expect(subject.links.reddit_media).to eq 'https://www.reddit.com/r/spacex/comments/94zr0b/rspacex_merah_putih_media_thread_videos_images/'
      expect(subject.links.presskit).to eq 'https://www.spacex.com/sites/spacex/files/merahputihpresskit.pdf'
      expect(subject.links.article_link).to eq 'https://spaceflightnow.com/2018/08/07/indonesian-communications-satellite-deployed-in-orbit-by-spacex/'
      expect(subject.links.wikipedia).to eq 'https://en.wikipedia.org/wiki/Telkom_Indonesia'
      expect(subject.links.video_link).to eq 'https://www.youtube.com/watch?v=FjfQNBYv2IY'
      expect(subject.details).to eq 'Indonesian comsat intended to replace the aging Telkom 1 at 108° E. First reflight of a Block 5-version booster.'
      expect(subject.upcoming).to eq false
      expect(subject.static_fire_date_utc).to eq '2018-08-02T15:53:00.000Z'
    end
  end

  context '#info', vcr: { cassette_name: 'launches' } do
    subject do
      SPACEX::Launches.info
    end

    it 'returns and array of launch hashes' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a Hash
    end

    it 'returns the correct number of launches' do
      expect(subject.count).to eq 90
    end

    it 'returns the subject.first launch' do
      expect(subject.first.flight_number).to eq 1
      expect(subject.first.mission_name).to eq 'FalconSat'
      expect(subject.first.launch_year).to eq '2006'
      expect(subject.first.launch_date_unix).to eq 1_143_239_400
      expect(subject.first.launch_date_utc).to eq '2006-03-24T22:30:00.000Z'
      expect(subject.first.launch_date_local).to eq '2006-03-25T10:30:00+12:00'
      expect(subject.first.launch_success).to eq false
      expect(subject.first.rocket.rocket_id).to eq 'falcon1'
      expect(subject.first.rocket.rocket_name).to eq 'Falcon 1'
      expect(subject.first.rocket.rocket_type).to eq 'Merlin A'
      expect(subject.first.rocket.first_stage.cores.first.core_serial).to eq 'Merlin1A'
      expect(subject.first.rocket.first_stage.cores.first.flight).to eq 1
      expect(subject.first.rocket.first_stage.cores.first.block).to eq nil
      expect(subject.first.rocket.first_stage.cores.first.reused).to eq false
      expect(subject.first.rocket.first_stage.cores.first.land_success).to eq nil
      expect(subject.first.rocket.first_stage.cores.first.landing_type).to eq nil
      expect(subject.first.rocket.first_stage.cores.first.landing_vehicle).to eq nil
      expect(subject.first.rocket.second_stage.block).to eq 1
      expect(subject.first.rocket.second_stage.payloads.first.payload_id).to eq 'FalconSAT-2'
      expect(subject.first.rocket.second_stage.payloads.first.norad_id.first).to eq nil
      expect(subject.first.rocket.second_stage.payloads.first.reused).to eq false
      expect(subject.first.rocket.second_stage.payloads.first.customers.first).to eq 'DARPA'
      expect(subject.first.rocket.second_stage.payloads.first.nationality).to eq 'United States'
      expect(subject.first.rocket.second_stage.payloads.first.manufacturer).to eq 'SSTL'
      expect(subject.first.rocket.second_stage.payloads.first.payload_type).to eq 'Satellite'
      expect(subject.first.rocket.second_stage.payloads.first.payload_mass_kg).to eq 20
      expect(subject.first.rocket.second_stage.payloads.first.payload_mass_lbs).to eq 43
      expect(subject.first.rocket.second_stage.payloads.first.orbit).to eq 'LEO'
      expect(subject.first.rocket.second_stage.payloads.first.orbit_params.reference_system).to eq 'geocentric'
      expect(subject.first.rocket.second_stage.payloads.first.orbit_params.regime).to eq 'low-earth'
      expect(subject.first.rocket.second_stage.payloads.first.orbit_params.longitude).to eq nil
      expect(subject.first.rocket.second_stage.payloads.first.orbit_params.semi_major_axis_km).to eq nil
      expect(subject.first.rocket.second_stage.payloads.first.orbit_params.eccentricity).to eq nil
      expect(subject.first.rocket.second_stage.payloads.first.orbit_params.periapsis_km).to eq 400
      expect(subject.first.rocket.second_stage.payloads.first.orbit_params.apoapsis_km).to eq 500
      expect(subject.first.rocket.second_stage.payloads.first.orbit_params.inclination_deg).to eq 39
      expect(subject.first.rocket.second_stage.payloads.first.orbit_params.period_min).to eq nil
      expect(subject.first.rocket.second_stage.payloads.first.orbit_params.lifespan_years).to eq nil
      expect(subject.first.rocket.second_stage.payloads.first.orbit_params.epoch).to eq nil
      expect(subject.first.rocket.second_stage.payloads.first.orbit_params.mean_motion).to eq nil
      expect(subject.first.rocket.second_stage.payloads.first.orbit_params.raan).to eq nil
      expect(subject.first.telemetry.flight_club).to eq nil
      expect(subject.first.reuse).to be_nil
      expect(subject.first.launch_site.site_id).to eq 'kwajalein_atoll'
      expect(subject.first.launch_site.site_name).to eq 'Kwajalein Atoll'
      expect(subject.first.launch_site.site_name_long).to eq 'Kwajalein Atoll Omelek Island'
      expect(subject.first.launch_success).to eq false
      expect(subject.first.links.mission_patch).to eq 'https://images2.imgbox.com/40/e3/GypSkayF_o.png'
      expect(subject.first.links.mision_patch_small).to eq nil
      expect(subject.first.links.reddit_campaign).to eq nil
      expect(subject.first.links.reddit_launch).to eq nil
      expect(subject.first.links.reddit_recovery).to eq nil
      expect(subject.first.links.reddit_media).to eq nil
      expect(subject.first.links.presskit).to eq nil
      expect(subject.first.links.article_link).to eq 'https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html'
      expect(subject.first.links.wikipedia).to eq 'https://en.wikipedia.org/wiki/DemoSat'
      expect(subject.first.links.video_link).to eq 'https://www.youtube.com/watch?v=0a_00nJ_Y88'
      expect(subject.first.details).to eq 'Engine failure at 33 seconds and loss of vehicle'
      expect(subject.first.upcoming).to eq false
      expect(subject.first.static_fire_date_utc).to eq '2006-03-17T00:00:00.000Z'
    end

    it 'returns the subject.last scheduled launch' do
      expect(subject.last.flight_number).to eq 90
      expect(subject.last.mission_name).to eq 'GPS IIIA-3'
      expect(subject.last.launch_year).to eq '2019'
      expect(subject.last.launch_date_unix).to eq 1_569_888_000
      expect(subject.last.launch_date_utc).to eq '2019-10-01T00:00:00.000Z'
      expect(subject.last.launch_date_local).to eq '2019-09-30T20:00:00-04:00'
      expect(subject.last.launch_success).to eq nil
      expect(subject.last.rocket.rocket_id).to eq 'falcon9'
      expect(subject.last.rocket.rocket_name).to eq 'Falcon 9'
      expect(subject.last.rocket.rocket_type).to eq 'FT'
      expect(subject.last.rocket.last_stage).to be_nil
      expect(subject.last.rocket.second_stage.block).to eq nil
      expect(subject.last.rocket.second_stage.payloads.last.payload_id).to eq 'GPS IIIA-3'
      expect(subject.last.rocket.second_stage.payloads.last.norad_id.last).to eq nil
      expect(subject.last.rocket.second_stage.payloads.last.reused).to eq false
      expect(subject.last.rocket.second_stage.payloads.last.customers.last).to eq 'USAF'
      expect(subject.last.rocket.second_stage.payloads.last.nationality).to eq 'United States'
      expect(subject.last.rocket.second_stage.payloads.last.manufacturer).to eq 'Lockheed Martin'
      expect(subject.last.rocket.second_stage.payloads.last.payload_type).to eq 'Satellite'
      expect(subject.last.rocket.second_stage.payloads.last.payload_mass_kg).to eq 3880
      expect(subject.last.rocket.second_stage.payloads.last.payload_mass_lbs).to eq 8553.94
      expect(subject.last.rocket.second_stage.payloads.last.orbit).to eq 'MEO'
      expect(subject.last.rocket.second_stage.payloads.last.orbit_params.reference_system).to eq nil
      expect(subject.last.rocket.second_stage.payloads.last.orbit_params.regime).to eq nil
      expect(subject.last.rocket.second_stage.payloads.last.orbit_params.longitude).to eq nil
      expect(subject.last.rocket.second_stage.payloads.last.orbit_params.semi_major_axis_km).to eq nil
      expect(subject.last.rocket.second_stage.payloads.last.orbit_params.eccentricity).to eq nil
      expect(subject.last.rocket.second_stage.payloads.last.orbit_params.periapsis_km).to eq nil
      expect(subject.last.rocket.second_stage.payloads.last.orbit_params.apoapsis_km).to eq nil
      expect(subject.last.rocket.second_stage.payloads.last.orbit_params.inclination_deg).to eq nil
      expect(subject.last.rocket.second_stage.payloads.last.orbit_params.period_min).to eq nil
      expect(subject.last.rocket.second_stage.payloads.last.orbit_params.lifespan_years).to eq 15
      expect(subject.last.rocket.second_stage.payloads.last.orbit_params.epoch).to eq nil
      expect(subject.last.rocket.second_stage.payloads.last.orbit_params.mean_motion).to eq nil
      expect(subject.last.rocket.second_stage.payloads.last.orbit_params.raan).to eq nil
      expect(subject.last.telemetry.flight_club).to eq nil
      expect(subject.last.reuse).to be_nil
      expect(subject.last.launch_site.site_id).to eq 'ccafs_slc_40'
      expect(subject.last.launch_site.site_name).to eq 'CCAFS SLC 40'
      expect(subject.last.launch_site.site_name_long).to eq 'Cape Canaveral Air Force Station Space Launch Complex 40'
      expect(subject.last.launch_success).to eq nil
      expect(subject.last.links.mission_patch).to eq nil
      expect(subject.last.links.mision_patch_small).to eq nil
      expect(subject.last.links.reddit_campaign).to eq nil
      expect(subject.last.links.reddit_launch).to eq nil
      expect(subject.last.links.reddit_recovery).to eq nil
      expect(subject.last.links.reddit_media).to eq nil
      expect(subject.last.links.presskit).to eq nil
      expect(subject.last.links.article_link).to eq nil
      expect(subject.last.links.wikipedia).to eq nil
      expect(subject.last.links.video_link).to eq nil
      expect(subject.last.details).to eq nil
      expect(subject.last.upcoming).to eq true
      expect(subject.last.static_fire_date_utc).to eq nil
    end
  end

  context '#info(68)', vcr: { cassette_name: 'launches/68' } do
    subject do
      SPACEX::Launches.info(68)
    end

    it 'returns info for flight number 68' do
      expect(subject.flight_number).to eq(68)
      expect(subject.rocket.rocket_name).to eq('Falcon 9')
      expect(subject.rocket.first_stage.cores.first.core_serial).to eq('B1049')
      expect(subject.rocket.second_stage.payloads.first.orbit_params.regime).to eq('geostationary')

      expect(subject).to eq(
        'flight_number' => 68,
        'mission_name' => 'Telstar 18V',
        'mission_id' => [
          'F4F83DE'
        ],
        'launch_year' => '2018',
        'launch_date_unix' => 1_536_554_700,
        'launch_date_utc' => '2018-09-10T04:45:00.000Z',
        'launch_date_local' => '2018-09-10T00:45:00-04:00',
        'is_tentative' => false,
        'tentative_max_precision' => 'hour',
        'rocket' => {
          'rocket_id' => 'falcon9',
          'rocket_name' => 'Falcon 9',
          'rocket_type' => 'FT',
          'first_stage' => {
            'cores' => [{
              'core_serial' => 'B1049',
              'flight' => 1,
              'block' => 5,
              'reused' => false,
              'land_success' => true,
              'landing_intent' => true,
              'landing_type' => 'ASDS',
              'landing_vehicle' => 'OCISLY'
            }]
          },
          'second_stage' => {
            'block' => 5,
            'payloads' => [{
              'payload_id' => 'Telstar 18V',
              'norad_id' => [43_611],
              'reused' => false,
              'customers' => ['Telesat'],
              'nationality' => 'Canada',
              'manufacturer' => 'SSL',
              'payload_type' => 'Satellite',
              'payload_mass_kg' => 7060,
              'payload_mass_lbs' => 15_564.64,
              'orbit' => 'GTO',
              'orbit_params' => {
                'reference_system' => 'geocentric',
                'regime' => 'geostationary',
                'longitude' => 138,
                'semi_major_axis_km' => 7226.647,
                'eccentricity' => 0.0013608,
                'periapsis_km' => 838.677,
                'apoapsis_km' => 858.346,
                'inclination_deg' => 98.8086,
                'period_min' => 101.897,
                'lifespan_years' => 15,
                'epoch' => '2018-09-07T06:29:40.000Z',
                'mean_motion' => 14.13180055,
                'raan' => 322.194,
                'arg_of_pericenter' => 130.3173,
                'mean_anomaly' => 328.1487
              }
            }]
          },
          'fairings' => {
            'reused' => false,
            'recovery_attempt' => false,
            'recovered' => false,
            'ship' => nil
          }
        },
        'ships' => %w[OCISLY HAWK GOQUEST],
        'telemetry' => {
          'flight_club' => 'https://www.flightclub.io/result/2d?code=T18V'
        },
        'launch_site' => {
          'site_id' => 'ccafs_slc_40',
          'site_name' => 'CCAFS SLC 40',
          'site_name_long' => 'Cape Canaveral Air Force Station Space Launch Complex 40'
        },
        'launch_success' => true,
        'links' => {
          'mission_patch' => 'https://images2.imgbox.com/ba/db/3plcm5IB_o.png',
          'mission_patch_small' => 'https://images2.imgbox.com/2d/d2/jStsqeLC_o.png',
          'reddit_campaign' => 'https://www.reddit.com/r/spacex/comments/95cte4/telstar_18v_apstar_5c_launch_campaign_thread/',
          'reddit_launch' => 'https://www.reddit.com/r/spacex/comments/9e7bmq/rspacex_telstar_18v_official_launch_discussion/',
          'reddit_recovery' => 'https://www.reddit.com/r/spacex/comments/9erxlh/telstar_18_vantage_recovery_thread/',
          'reddit_media' => 'https://www.reddit.com/r/spacex/comments/9ebkqw/rspacex_telstar_18v_media_thread_videos_images/',
          'presskit' => 'https://www.spacex.com/sites/spacex/files/telstar18vantagepresskit.pdf',
          'article_link' => 'https://spaceflightnow.com/2018/09/10/spacex-telesat-achieve-repeat-success-with-midnight-hour-launch/',
          'wikipedia' => 'https://en.wikipedia.org/wiki/Telstar_18V',
          'video_link' => 'https://www.youtube.com/watch?v=Apw3xqwsG1U',
          'flickr_images' => [
            'https://farm2.staticflickr.com/1878/43690848045_492ef182dd_o.jpg',
            'https://farm2.staticflickr.com/1856/43881229604_6d42e838b6_o.jpg',
            'https://farm2.staticflickr.com/1852/43881223704_93777e34af_o.jpg',
            'https://farm2.staticflickr.com/1841/43881217094_558b7b214e_o.jpg',
            'https://farm2.staticflickr.com/1869/43881193934_423eff8c86_o.jpg'
          ]
        },
        'details' => 'SpaceX\'s sixteenth flight of 2018 launched the Telstar '\
          '18v GEO communication satellite for Telesat, the second launch for '\
          'the canadian company in a few months. The first stage was a new '\
          'Falcon 9 V1.2 Block 5 which was successfully recovered on OCISLY.',
        'upcoming' => false,
        'static_fire_date_utc' => '2018-09-05T07:21:00.000Z',
        'static_fire_date_unix' => 1_536_132_060
      )
    end
  end

  context '#next', vcr: { cassette_name: 'launches/next' } do
    subject do
      SPACEX::Launches.next
    end

    it 'returns next launch' do
      expect(subject.flight_number).to eq 70
      expect(subject.mission_name).to eq 'Es’hail 2'
      expect(subject.launch_year).to eq '2018'
      expect(subject.launch_date_unix).to eq 1_541_030_400
      expect(subject.launch_date_utc).to eq '2018-11-01T00:00:00.000Z'
      expect(subject.launch_date_local).to eq '2018-10-31T20:00:00-04:00'
      expect(subject.launch_success).to eq nil
      expect(subject.rocket.rocket_id).to eq 'falcon9'
      expect(subject.rocket.rocket_name).to eq 'Falcon 9'
      expect(subject.rocket.rocket_type).to eq 'FT'
      expect(subject.rocket.first_stage.cores.first.core_serial).to eq nil
      expect(subject.rocket.first_stage.cores.first.flight).to eq nil
      expect(subject.rocket.first_stage.cores.first.block).to eq 5
      expect(subject.rocket.first_stage.cores.first.reused).to eq false
      expect(subject.rocket.first_stage.cores.first.land_success).to eq nil
      expect(subject.rocket.first_stage.cores.first.landing_type).to eq nil
      expect(subject.rocket.first_stage.cores.first.landing_vehicle).to eq nil
      expect(subject.rocket.second_stage.block).to eq 5
      expect(subject.rocket.second_stage.payloads.first.payload_id).to eq 'Es’hail 2'
      expect(subject.rocket.second_stage.payloads.first.norad_id.first).to eq nil
      expect(subject.rocket.second_stage.payloads.first.reused).to eq false
      expect(subject.rocket.second_stage.payloads.first.customers.first).to eq 'Es’hailSat'
      expect(subject.rocket.second_stage.payloads.first.nationality).to eq 'Qatar'
      expect(subject.rocket.second_stage.payloads.first.manufacturer).to eq 'Mitsubishi Electric'
      expect(subject.rocket.second_stage.payloads.first.payload_type).to eq 'Satellite'
      expect(subject.rocket.second_stage.payloads.first.payload_mass_kg).to eq 3000
      expect(subject.rocket.second_stage.payloads.first.payload_mass_lbs).to eq 6_613.868
      expect(subject.rocket.second_stage.payloads.first.orbit).to eq 'GTO'
      expect(subject.rocket.second_stage.payloads.first.orbit_params.regime).to eq 'geostationary'
      expect(subject.rocket.second_stage.payloads.first.orbit_params.longitude).to eq 25.5
      expect(subject.rocket.second_stage.payloads.first.orbit_params.semi_major_axis_km).to eq nil
      expect(subject.rocket.second_stage.payloads.first.orbit_params.eccentricity).to eq nil
      expect(subject.rocket.second_stage.payloads.first.orbit_params.periapsis_km).to eq nil
      expect(subject.rocket.second_stage.payloads.first.orbit_params.apoapsis_km).to eq nil
      expect(subject.rocket.second_stage.payloads.first.orbit_params.inclination_deg).to eq nil
      expect(subject.rocket.second_stage.payloads.first.orbit_params.period_min).to eq nil
      expect(subject.rocket.second_stage.payloads.first.orbit_params.lifespan_years).to eq 15
      expect(subject.rocket.second_stage.payloads.first.orbit_params.epoch).to eq nil
      expect(subject.rocket.second_stage.payloads.first.orbit_params.mean_motion).to eq nil
      expect(subject.rocket.second_stage.payloads.first.orbit_params.raan).to eq nil
      expect(subject.telemetry.flight_club).to eq nil
      expect(subject.launch_site.site_id).to eq 'ccafs_slc_40'
      expect(subject.launch_site.site_name).to eq 'CCAFS SLC 40'
      expect(subject.launch_site.site_name_long).to eq 'Cape Canaveral Air Force Station Space Launch Complex 40'
      expect(subject.launch_success).to eq nil
      expect(subject.links.mission_patch).to eq nil
      expect(subject.links.mision_patch_small).to eq nil
      expect(subject.links.reddit_campaign).to eq nil
      expect(subject.links.reddit_launch).to eq nil
      expect(subject.links.reddit_recovery).to eq nil
      expect(subject.links.reddit_media).to eq nil
      expect(subject.links.presskit).to eq nil
      expect(subject.links.article_link).to eq nil
      expect(subject.links.wikipedia).to eq nil
      expect(subject.links.video_link).to eq nil
      expect(subject.details).to eq nil
      expect(subject.upcoming).to eq true
      expect(subject.static_fire_date_utc).to eq nil
    end
  end
end
