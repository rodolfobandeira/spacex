require 'spec_helper'

describe SPACEX::V4::Launches do
  context '#info', vcr: { cassette_name: 'v4/launches' } do
    subject do
      SPACEX::V4::Launches.info
    end

    it 'returns and array of launch hashes' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a Hash
    end

    it 'returns the correct number of launches' do
      expect(subject.count).to eq 148
    end

    it 'returns the subject.first launch' do
      expect(subject.first.id).to eq '5eb87cd9ffd86e000604b32a'
      expect(subject.first.flight_number).to eq 1
      expect(subject.first.name).to eq 'FalconSat'
      expect(subject.first.date_utc).to eq '2006-03-24T22:30:00.000Z'
      expect(subject.first.date_unix).to eq 1143239400
      expect(subject.first.date_local).to eq '2006-03-25T10:30:00+12:00'
      expect(subject.first.date_precision).to eq 'hour'
      expect(subject.first.static_fire_date_utc).to eq '2006-03-17T00:00:00.000Z'
      expect(subject.first.static_fire_date_unix).to eq 1142553600
      expect(subject.first.tbd).to be false
      expect(subject.first.net).to be false
      expect(subject.first.window).to eq 0
      expect(subject.first.rocket).to eq '5e9d0d95eda69955f709d1eb'
      expect(subject.first.success).to be false
      expect(subject.first.failures.first.time).to eq 33
      expect(subject.first.failures.first.altitude).to be_nil
      expect(subject.first.failures.first.reason).to eq 'merlin engine failure'
      expect(subject.first.upcoming).to be false
      expect(subject.first.details).to eq 'Engine failure at 33 seconds and loss of vehicle'
      expect(subject.first.fairings.reused).to be false 
      expect(subject.first.fairings.recovery_attempt).to be false 
      expect(subject.first.fairings.recovered).to be false 
      expect(subject.first.fairings.ships).to eq []
      expect(subject.first.crew).to eq []
      expect(subject.first.ships).to eq []
      expect(subject.first.capsules).to eq []
      expect(subject.first.payloads.first).to eq '5eb0e4b5b6c3bb0006eeb1e1'
      expect(subject.first.launchpad).to eq '5e9e4502f5090995de566f86'
      expect(subject.first.cores.first.core).to eq '5e9e289df35918033d3b2623'
      expect(subject.first.cores.first.flight).to eq 1
      expect(subject.first.cores.first.gridfins).to be false
      expect(subject.first.cores.first.legs).to be false
      expect(subject.first.cores.first.reused).to be false
      expect(subject.first.cores.first.landing_attempt).to be false
      expect(subject.first.cores.first.landing_success).to be_nil
      expect(subject.first.cores.first.landing_type).to be_nil
      expect(subject.first.cores.first.landpad).to be_nil
      expect(subject.first.links.patch.small).to eq 'https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png'
      expect(subject.first.links.patch.large).to eq 'https://images2.imgbox.com/40/e3/GypSkayF_o.png'
      expect(subject.first.links.reddit.campaign).to be_nil 
      expect(subject.first.links.reddit.launch).to be_nil 
      expect(subject.first.links.reddit.media).to be_nil 
      expect(subject.first.links.reddit.recovery).to be_nil 
      expect(subject.first.links.flickr.small).to eq []
      expect(subject.first.links.flickr.original).to eq []
      expect(subject.first.links.presskit).to be_nil
      expect(subject.first.links.webcast).to eq 'https://www.youtube.com/watch?v=0a_00nJ_Y88'
      expect(subject.first.links.youtube_id).to eq '0a_00nJ_Y88'
      expect(subject.first.links.article).to eq 'https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html'
      expect(subject.first.links.wikipedia).to eq 'https://en.wikipedia.org/wiki/DemoSat'
      expect(subject.first.auto_update).to be true
    end

    it 'returns the subject.last scheduled launch' do
      expect(subject.last.id).to eq '608d3d23ffcee803616cbde2'
      expect(subject.last.flight_number).to eq 157
      expect(subject.last.name).to eq 'NROL-85'
      expect(subject.last.date_utc).to eq '2022-01-01T00:00:00.000Z'
      expect(subject.last.date_unix).to eq 1640995200
      expect(subject.last.date_local).to eq '2021-12-31T16:00:00-08:00'
      expect(subject.last.date_precision).to eq 'quarter'
      expect(subject.last.static_fire_date_utc).to be_nil
      expect(subject.last.static_fire_date_unix).to be_nil
      expect(subject.last.tbd).to be false
      expect(subject.last.net).to be false
      expect(subject.last.window).to be_nil
      expect(subject.last.rocket).to eq '5e9d0d95eda69973a809d1ec'
      expect(subject.last.success).to be_nil
      expect(subject.last.failures).to eq []
      expect(subject.last.upcoming).to be true
      expect(subject.last.details).to be_nil
      expect(subject.last.fairings.reused).to be_nil
      expect(subject.last.fairings.recovery_attempt).to be_nil
      expect(subject.last.fairings.recovered).to be_nil
      expect(subject.last.fairings.ships).to eq []
      expect(subject.last.crew).to eq []
      expect(subject.last.ships).to eq []
      expect(subject.last.capsules).to eq []
      expect(subject.last.payloads.first).to eq '608d3d7fffcee803616cbde7'
      expect(subject.last.launchpad).to eq '5e9e4502f509092b78566f87'
      expect(subject.last.cores.first.core).to be_nil
      expect(subject.last.cores.first.flight).to be_nil
      expect(subject.last.cores.first.gridfins).to be_nil
      expect(subject.last.cores.first.legs).to be_nil
      expect(subject.last.cores.first.reused).to be_nil
      expect(subject.last.cores.first.landing_attempt).to be_nil
      expect(subject.last.cores.first.landing_success).to be_nil
      expect(subject.last.cores.first.landing_type).to be_nil
      expect(subject.last.cores.first.landpad).to be_nil
      expect(subject.last.links.patch.small).to be_nil
      expect(subject.last.links.patch.large).to be_nil
      expect(subject.last.links.reddit.campaign).to be_nil 
      expect(subject.last.links.reddit.launch).to be_nil 
      expect(subject.last.links.reddit.media).to be_nil 
      expect(subject.last.links.reddit.recovery).to be_nil 
      expect(subject.last.links.flickr.small).to eq []
      expect(subject.last.links.flickr.original).to eq []
      expect(subject.last.links.presskit).to be_nil
      expect(subject.last.links.webcast).to be_nil
      expect(subject.last.links.youtube_id).to be_nil
      expect(subject.last.links.article).to be_nil
      expect(subject.last.links.wikipedia).to be_nil
      expect(subject.last.auto_update).to be true
    end
  end

  context "#info('5eb87d42ffd86e000604b384')", vcr: { cassette_name: 'v4/launches/5eb87d42ffd86e000604b384' } do
    subject do
      SPACEX::V4::Launches.info('5eb87d42ffd86e000604b384')
    end

    it 'returns info for launch id 5eb87d42ffd86e000604b384' do
      expect(subject.id).to eq '5eb87d42ffd86e000604b384'
      expect(subject.flight_number).to eq 91
      expect(subject.name).to eq 'CRS-20'
      expect(subject.date_utc).to eq '2020-03-07T04:50:31.000Z'
      expect(subject.date_unix).to eq 1583556631
      expect(subject.date_local).to eq '2020-03-06T23:50:31-05:00'
      expect(subject.date_precision).to eq 'hour'
      expect(subject.static_fire_date_utc).to eq '2020-03-01T10:20:00.000Z'
      expect(subject.static_fire_date_unix).to eq 1583058000
      expect(subject.tbd).to be false
      expect(subject.net).to be false
      expect(subject.window).to eq 0
      expect(subject.rocket).to eq '5e9d0d95eda69973a809d1ec'
      expect(subject.success).to be true
      expect(subject.failures).to eq []
      expect(subject.upcoming).to be false
      expect(subject.details).to eq "SpaceX's 20th and final Crew Resupply Mission under the original NASA CRS contract, this mission brings essential supplies to the International Space Station using SpaceX's reusable Dragon spacecraft. It is the last scheduled flight of a Dragon 1 capsule. (CRS-21 and up under the new Commercial Resupply Services 2 contract will use Dragon 2.) The external payload for this mission is the Bartolomeo ISS external payload hosting platform. Falcon 9 and Dragon will launch from SLC-40, Cape Canaveral Air Force Station and the booster will land at LZ-1. The mission will be complete with return and recovery of the Dragon capsule and down cargo."
      expect(subject.fairings).to be_nil
      expect(subject.crew).to eq []
      expect(subject.ships).to eq []
      expect(subject.capsules.first).to eq '5e9e2c5cf359185d753b266f'
      expect(subject.payloads.first).to eq '5eb0e4d0b6c3bb0006eeb253'
      expect(subject.launchpad).to eq '5e9e4501f509094ba4566f84'
      expect(subject.cores.first.core).to eq '5e9e28a7f359187afd3b2662'
      expect(subject.cores.first.flight).to eq 2
      expect(subject.cores.first.gridfins).to be true
      expect(subject.cores.first.legs).to be true
      expect(subject.cores.first.reused).to be true
      expect(subject.cores.first.landing_attempt).to be true
      expect(subject.cores.first.landing_success).to be true
      expect(subject.cores.first.landing_type).to eq 'RTLS'
      expect(subject.cores.first.landpad).to eq '5e9e3032383ecb267a34e7c7'
      expect(subject.links.patch.small).to eq 'https://images2.imgbox.com/53/22/dh0XSLXO_o.png'
      expect(subject.links.patch.large).to eq 'https://images2.imgbox.com/15/2b/NAcsTEB6_o.png'
      expect(subject.links.reddit.campaign).to eq 'https://www.reddit.com/r/spacex/comments/ezn6n0/crs20_launch_campaign_thread'
      expect(subject.links.reddit.launch).to eq 'https://www.reddit.com/r/spacex/comments/fe8pcj/rspacex_crs20_official_launch_discussion_updates/'
      expect(subject.links.reddit.media).to eq 'https://www.reddit.com/r/spacex/comments/fes64p/rspacex_crs20_media_thread_videos_images_gifs/'
      expect(subject.links.reddit.recovery).to be_nil
      expect(subject.links.flickr.small).to eq []
      expect(subject.links.flickr.original).to eq [
        "https://live.staticflickr.com/65535/49635401403_96f9c322dc_o.jpg",
        "https://live.staticflickr.com/65535/49636202657_e81210a3ca_o.jpg",
        "https://live.staticflickr.com/65535/49636202572_8831c5a917_o.jpg",
        "https://live.staticflickr.com/65535/49635401423_e0bef3e82f_o.jpg",
        "https://live.staticflickr.com/65535/49635985086_660be7062f_o.jpg"
      ]
      expect(subject.links.presskit).to eq 'https://www.spacex.com/sites/spacex/files/crs-20_mission_press_kit.pdf'
      expect(subject.links.webcast).to eq 'https://youtu.be/1MkcWK2PnsU'
      expect(subject.links.youtube_id).to eq '1MkcWK2PnsU'
      expect(subject.links.article).to eq 'https://spaceflightnow.com/2020/03/07/late-night-launch-of-spacex-cargo-ship-marks-end-of-an-era/'
      expect(subject.links.wikipedia).to eq 'https://en.wikipedia.org/wiki/SpaceX_CRS-20'
      expect(subject.auto_update).to be true
    end
  end

  context '#all', vcr: { cassette_name: 'v4/launches#all' } do
    subject do
      SPACEX::V4::Launches.all
    end

    it 'returns and array of launch hashes' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a Hash
    end

    it 'returns the correct number of launches' do
      expect(subject.count).to eq 148
    end

    it 'returns all launches' do
      expect(subject.first.id).to eq '5eb87cd9ffd86e000604b32a'
      expect(subject.first.flight_number).to eq 1
      expect(subject.first.name).to eq 'FalconSat'

      expect(subject.last.id).to eq '608d3d23ffcee803616cbde2'
      expect(subject.last.flight_number).to eq 157
      expect(subject.last.name).to eq 'NROL-85'
    end
  end

  context '#latest', vcr: { cassette_name: 'v4/launches/latest' } do
    subject do
      SPACEX::V4::Launches.latest
    end

    it 'returns latest launch' do
      expect(subject.id).to eq '6161d2006db1a92bfba85356'
      expect(subject.flight_number).to eq 141
      expect(subject.name).to eq 'CRS-24'
      expect(subject.date_utc).to eq '2021-08-29T07:14:00.000Z'
      expect(subject.date_unix).to eq 1630221240
      expect(subject.date_local).to eq '2021-08-29T03:14:00-04:00'
      expect(subject.date_precision).to eq 'hour'
      expect(subject.static_fire_date_utc).to be_nil
      expect(subject.static_fire_date_unix).to be_nil
      expect(subject.tbd).to be false
      expect(subject.net).to be false
      expect(subject.window).to eq 0
      expect(subject.rocket).to eq '5e9d0d95eda69973a809d1ec'
      expect(subject.success).to be true
      expect(subject.failures).to eq []
      expect(subject.upcoming).to be false
      expect(subject.details).to be_nil
      expect(subject.fairings).to be_nil
      expect(subject.crew).to eq []
      expect(subject.ships).to eq []
      expect(subject.capsules).to eq []
      expect(subject.payloads.first).to eq '6161d22a6db1a92bfba85357'
      expect(subject.launchpad).to eq '5e9e4502f509094188566f88'
      expect(subject.cores.first.core).to be_nil
      expect(subject.cores.first.flight).to be_nil
      expect(subject.cores.first.gridfins).to be_nil
      expect(subject.cores.first.legs).to be_nil
      expect(subject.cores.first.reused).to be_nil
      expect(subject.cores.first.landing_attempt).to be_nil
      expect(subject.cores.first.landing_success).to be_nil
      expect(subject.cores.first.landing_type).to be_nil
      expect(subject.cores.first.landpad).to be_nil
      expect(subject.links.patch.small).to be_nil
      expect(subject.links.patch.large).to be_nil
      expect(subject.links.reddit.campaign).to be_nil 
      expect(subject.links.reddit.launch).to be_nil 
      expect(subject.links.reddit.media).to be_nil 
      expect(subject.links.reddit.recovery).to be_nil 
      expect(subject.links.flickr.small).to eq []
      expect(subject.links.flickr.original).to eq []
      expect(subject.links.presskit).to be_nil
      expect(subject.links.webcast).to be_nil
      expect(subject.links.youtube_id).to be_nil
      expect(subject.links.article).to be_nil
      expect(subject.links.wikipedia).to be_nil
      expect(subject.auto_update).to be true
    end
  end

  context '#next', vcr: { cassette_name: 'v4/launches/next' } do
    subject do
      SPACEX::V4::Launches.next
    end

    it 'returns the next launch' do
      expect(subject.id).to eq '5fe3b15eb3467846b324216d'
      expect(subject.flight_number).to eq 142
      expect(subject.name).to eq 'Crew-3'
      expect(subject.date_utc).to eq '2021-10-30T06:43:00.000Z'
      expect(subject.date_unix).to eq 1635576180
      expect(subject.date_local).to eq '2021-10-30T02:43:00-04:00'
      expect(subject.date_precision).to eq 'hour'
      expect(subject.static_fire_date_utc).to be_nil
      expect(subject.static_fire_date_unix).to be_nil
      expect(subject.tbd).to be false
      expect(subject.net).to be false
      expect(subject.window).to eq 0
      expect(subject.rocket).to eq '5e9d0d95eda69973a809d1ec'
      expect(subject.success).to be_nil
      expect(subject.failures).to eq []
      expect(subject.upcoming).to be true
      expect(subject.details).to be_nil
      expect(subject.fairings).to be_nil
      expect(subject.crew).to eq [
        "5fe3c587b3467846b3242198",
        "5fe3c5beb3467846b3242199",
        "5fe3c5f6b3467846b324219a",
        "60c4b5ad4e041c0b356db393"
      ]
      expect(subject.ships).to eq []
      expect(subject.capsules).to eq []
      expect(subject.payloads.first).to eq '5fe3b3bab3467846b3242174'
      expect(subject.launchpad).to eq '5e9e4502f509094188566f88'
      expect(subject.cores.first.core).to be_nil
      expect(subject.cores.first.flight).to be_nil
      expect(subject.cores.first.gridfins).to be_nil
      expect(subject.cores.first.legs).to be_nil
      expect(subject.cores.first.reused).to be_nil
      expect(subject.cores.first.landing_attempt).to be_nil
      expect(subject.cores.first.landing_success).to be_nil
      expect(subject.cores.first.landing_type).to be_nil
      expect(subject.cores.first.landpad).to be_nil
      expect(subject.links.patch.small).to eq 'https://i.imgur.com/KhQ11oo.png'
      expect(subject.links.patch.large).to eq 'https://i.imgur.com/M6GvRVe.png'
      expect(subject.links.reddit.campaign).to be_nil 
      expect(subject.links.reddit.launch).to be_nil 
      expect(subject.links.reddit.media).to be_nil 
      expect(subject.links.reddit.recovery).to be_nil 
      expect(subject.links.flickr.small).to eq []
      expect(subject.links.flickr.original).to eq []
      expect(subject.links.presskit).to be_nil
      expect(subject.links.webcast).to be_nil
      expect(subject.links.youtube_id).to be_nil
      expect(subject.links.article).to be_nil
      expect(subject.links.wikipedia).to be_nil
      expect(subject.auto_update).to be true
    end
  end
end
