# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'Merah Putih' do
end

describe SPACEX do
  context 'Launches#latest', vcr: { cassette_name: 'launches/latest' } do
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

      expect(subject.rocket.second_stage.payloads.first.orbit_params.reference_system).to eq 'geocentric'
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

  context 'Launches#all', vcr: { cassette_name: 'launches/all' } do
    subject do
      SPACEX::Launches.all
    end
    let(:first) { subject.first }
    let(:last) { subject.last }

    it 'returns and array of launch hashes' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a Hash
    end

    it 'returns the correct number of launches' do
      expect(subject.count).to eq 90
    end

    it 'returns the first launch' do
      expect(first.flight_number).to eq 1
      expect(first.mission_name).to eq 'FalconSat'
      expect(first.launch_year).to eq '2006'
      expect(first.launch_date_unix).to eq 1_143_239_400
      expect(first.launch_date_utc).to eq '2006-03-24T22:30:00.000Z'
      expect(first.launch_date_local).to eq '2006-03-25T10:30:00+12:00'
      expect(first.launch_success).to eq false

      expect(first.rocket.rocket_id).to eq 'falcon1'
      expect(first.rocket.rocket_name).to eq 'Falcon 1'
      expect(first.rocket.rocket_type).to eq 'Merlin A'

      expect(first.rocket.first_stage.cores.first.core_serial).to eq 'Merlin1A'
      expect(first.rocket.first_stage.cores.first.flight).to eq 1
      expect(first.rocket.first_stage.cores.first.block).to eq nil
      expect(first.rocket.first_stage.cores.first.reused).to eq false
      expect(first.rocket.first_stage.cores.first.land_success).to eq nil
      expect(first.rocket.first_stage.cores.first.landing_type).to eq nil
      expect(first.rocket.first_stage.cores.first.landing_vehicle).to eq nil

      expect(first.rocket.second_stage.block).to eq 1

      expect(first.rocket.second_stage.payloads.first.payload_id).to eq 'FalconSAT-2'
      expect(first.rocket.second_stage.payloads.first.norad_id.first).to eq nil
      expect(first.rocket.second_stage.payloads.first.reused).to eq false
      expect(first.rocket.second_stage.payloads.first.customers.first).to eq 'DARPA'
      expect(first.rocket.second_stage.payloads.first.nationality).to eq 'United States'
      expect(first.rocket.second_stage.payloads.first.manufacturer).to eq 'SSTL'
      expect(first.rocket.second_stage.payloads.first.payload_type).to eq 'Satellite'
      expect(first.rocket.second_stage.payloads.first.payload_mass_kg).to eq 20
      expect(first.rocket.second_stage.payloads.first.payload_mass_lbs).to eq 43
      expect(first.rocket.second_stage.payloads.first.orbit).to eq 'LEO'

      expect(first.rocket.second_stage.payloads.first.orbit_params.reference_system).to eq 'geocentric'
      expect(first.rocket.second_stage.payloads.first.orbit_params.regime).to eq 'low-earth'
      expect(first.rocket.second_stage.payloads.first.orbit_params.longitude).to eq nil
      expect(first.rocket.second_stage.payloads.first.orbit_params.semi_major_axis_km).to eq nil
      expect(first.rocket.second_stage.payloads.first.orbit_params.eccentricity).to eq nil
      expect(first.rocket.second_stage.payloads.first.orbit_params.periapsis_km).to eq 400
      expect(first.rocket.second_stage.payloads.first.orbit_params.apoapsis_km).to eq 500
      expect(first.rocket.second_stage.payloads.first.orbit_params.inclination_deg).to eq 39
      expect(first.rocket.second_stage.payloads.first.orbit_params.period_min).to eq nil
      expect(first.rocket.second_stage.payloads.first.orbit_params.lifespan_years).to eq nil
      expect(first.rocket.second_stage.payloads.first.orbit_params.epoch).to eq nil
      expect(first.rocket.second_stage.payloads.first.orbit_params.mean_motion).to eq nil
      expect(first.rocket.second_stage.payloads.first.orbit_params.raan).to eq nil

      expect(first.telemetry.flight_club).to eq nil

      expect(first.reuse).to be_nil

      expect(first.launch_site.site_id).to eq 'kwajalein_atoll'
      expect(first.launch_site.site_name).to eq 'Kwajalein Atoll'
      expect(first.launch_site.site_name_long).to eq 'Kwajalein Atoll Omelek Island'

      expect(first.launch_success).to eq false

      expect(first.links.mission_patch).to eq 'https://images2.imgbox.com/40/e3/GypSkayF_o.png'
      expect(first.links.mision_patch_small).to eq nil
      expect(first.links.reddit_campaign).to eq nil
      expect(first.links.reddit_launch).to eq nil
      expect(first.links.reddit_recovery).to eq nil
      expect(first.links.reddit_media).to eq nil
      expect(first.links.presskit).to eq nil
      expect(first.links.article_link).to eq 'https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html'
      expect(first.links.wikipedia).to eq 'https://en.wikipedia.org/wiki/DemoSat'
      expect(first.links.video_link).to eq 'https://www.youtube.com/watch?v=0a_00nJ_Y88'

      expect(first.details).to eq 'Engine failure at 33 seconds and loss of vehicle'
      expect(first.upcoming).to eq false
      expect(first.static_fire_date_utc).to eq '2006-03-17T00:00:00.000Z'
    end

    it 'returns the last scheduled launch' do
      expect(last.flight_number).to eq 90
      expect(last.mission_name).to eq 'GPS IIIA-3'
      expect(last.launch_year).to eq '2019'
      expect(last.launch_date_unix).to eq 1_569_888_000
      expect(last.launch_date_utc).to eq '2019-10-01T00:00:00.000Z'
      expect(last.launch_date_local).to eq '2019-09-30T20:00:00-04:00'
      expect(last.launch_success).to eq nil

      expect(last.rocket.rocket_id).to eq 'falcon9'
      expect(last.rocket.rocket_name).to eq 'Falcon 9'
      expect(last.rocket.rocket_type).to eq 'FT'

      expect(last.rocket.last_stage).to be_nil

      expect(last.rocket.second_stage.block).to eq nil

      expect(last.rocket.second_stage.payloads.last.payload_id).to eq 'GPS IIIA-3'
      expect(last.rocket.second_stage.payloads.last.norad_id.last).to eq nil
      expect(last.rocket.second_stage.payloads.last.reused).to eq false
      expect(last.rocket.second_stage.payloads.last.customers.last).to eq 'USAF'
      expect(last.rocket.second_stage.payloads.last.nationality).to eq 'United States'
      expect(last.rocket.second_stage.payloads.last.manufacturer).to eq 'Lockheed Martin'
      expect(last.rocket.second_stage.payloads.last.payload_type).to eq 'Satellite'
      expect(last.rocket.second_stage.payloads.last.payload_mass_kg).to eq 3880
      expect(last.rocket.second_stage.payloads.last.payload_mass_lbs).to eq 8553.94
      expect(last.rocket.second_stage.payloads.last.orbit).to eq 'MEO'

      expect(last.rocket.second_stage.payloads.last.orbit_params.reference_system).to eq nil
      expect(last.rocket.second_stage.payloads.last.orbit_params.regime).to eq nil
      expect(last.rocket.second_stage.payloads.last.orbit_params.longitude).to eq nil
      expect(last.rocket.second_stage.payloads.last.orbit_params.semi_major_axis_km).to eq nil
      expect(last.rocket.second_stage.payloads.last.orbit_params.eccentricity).to eq nil
      expect(last.rocket.second_stage.payloads.last.orbit_params.periapsis_km).to eq nil
      expect(last.rocket.second_stage.payloads.last.orbit_params.apoapsis_km).to eq nil
      expect(last.rocket.second_stage.payloads.last.orbit_params.inclination_deg).to eq nil
      expect(last.rocket.second_stage.payloads.last.orbit_params.period_min).to eq nil
      expect(last.rocket.second_stage.payloads.last.orbit_params.lifespan_years).to eq 15
      expect(last.rocket.second_stage.payloads.last.orbit_params.epoch).to eq nil
      expect(last.rocket.second_stage.payloads.last.orbit_params.mean_motion).to eq nil
      expect(last.rocket.second_stage.payloads.last.orbit_params.raan).to eq nil

      expect(last.telemetry.flight_club).to eq nil

      expect(last.reuse).to be_nil

      expect(last.launch_site.site_id).to eq 'ccafs_slc_40'
      expect(last.launch_site.site_name).to eq 'CCAFS SLC 40'
      expect(last.launch_site.site_name_long).to eq 'Cape Canaveral Air Force Station Space Launch Complex 40'

      expect(last.launch_success).to eq nil

      expect(last.links.mission_patch).to eq nil
      expect(last.links.mision_patch_small).to eq nil
      expect(last.links.reddit_campaign).to eq nil
      expect(last.links.reddit_launch).to eq nil
      expect(last.links.reddit_recovery).to eq nil
      expect(last.links.reddit_media).to eq nil
      expect(last.links.presskit).to eq nil
      expect(last.links.article_link).to eq nil
      expect(last.links.wikipedia).to eq nil
      expect(last.links.video_link).to eq nil

      expect(last.details).to eq nil
      expect(last.upcoming).to eq true
      expect(last.static_fire_date_utc).to eq nil
    end
  end
end
