# frozen_string_literal: true

require 'spec_helper'

describe SPACEX do
  context 'Missions', vcr: { cassette_name: 'missions/info' } do
    subject do
      SPACEX::Missions.retrieve_all
    end
    it 'returns missions info' do
      expect(subject[0]['mission_name']).to eq 'Iridium NEXT'
      expect(subject[0]['mission_id']).to eq 'F3364BF'
      expect(subject[0]['manufacturers']).to eq ['Orbital ATK']
      expect(subject[0]['payload_ids']).to eq ['Iridium NEXT 1', 'Iridium NEXT 2', 'Iridium NEXT 3', 'Iridium NEXT 4', 'Iridium NEXT 5', 'Iridium NEXT 6', 'Iridium NEXT 7']
      expect(subject[0]['wikipedia']).to eq 'https://en.wikipedia.org/wiki/Iridium_satellite_constellation'
      expect(subject[0]['website']).to eq 'https://www.iridiumnext.com/'
      expect(subject[0]['twitter']).to eq 'https://twitter.com/IridiumBoss?lang=en'
      expect(subject[0]['description']).to eq "In 2017, Iridium began launching Iridium NEXT, a second-generation worldwide network of telecommunications satellites, consisting of 66 active satellites, with another nine in-orbit spares and six on-ground spares. These satellites will incorporate features such as data transmission that were not emphasized in the original design. The constellation will provide L-band data speeds of up to 128 kbit/s to mobile terminals, up to 1.5 Mbit/s to Iridium Pilot marine terminals, and high-speed Ka-band service of up to 8 Mbit/s to fixed/transportable terminals. The next-generation terminals and service are expected to be commercially available by the end of 2018. However, Iridium's proposed use of its next-generation satellites has raised concerns the service will harmfully interfere with GPS devices. The satellites will incorporate a secondary payload for Aireon, a space-qualified ADS-B data receiver. This is for use by air traffic control and, via FlightAware, for use by airlines. A tertiary payload on 58 satellites is a marine AIS ship-tracker receiver, for Canadian company exactEarth Ltd. Iridium can also be used to provide a data link to other satellites in space, enabling command and control of other space assets regardless of the position of ground stations and gateways."
    end
  end
end
