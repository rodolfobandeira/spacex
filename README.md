SpaceX Ruby Client
===============

[![Gem Version](https://badge.fury.io/rb/spacex.svg)](https://badge.fury.io/rb/spacex)
[![Build Status](https://travis-ci.com/rodolfobandeira/spacex.svg?branch=master)](https://travis-ci.org/rodolfobandeira/spacex)

Ruby library that consumes SpaceX API


## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Latest Launch](#latest-launch)
  - [Company Info](#company-info)
  - [Roadster](#roadster)
  - [Dragon Capsules](#dragon-capsules)
- [Contributing](#contributing)
- [Copyright](#copyright)


## Installation

Add to Gemfile.

```
gem 'spacex'
```

Run `bundle install`.


## Usage

### Latest Launch

```ruby
require 'spacex'
latest_launch = SPACEX::Launches.latest

latest_launch.flight_number # 67
latest_launch.mission_name # 'Merah Putih'
latest_launch.launch_year # '2018'
latest_launch.launch_date_unix # 1_533_619_080
latest_launch.launch_date_utc # '2018-08-07T05:18:00.000Z'
latest_launch.launch_date_local # '2018-08-07T01:18:00-04:00'
latest_launch.launch_success # true
latest_launch.rocket.rocket_id # 'falcon9'
latest_launch.rocket.rocket_name # 'Falcon 9'
latest_launch.rocket.rocket_type # 'FT'
latest_launch.rocket.first_stage.cores.first.core_serial # 'B1046'
latest_launch.rocket.first_stage.cores.first.flight # 2
latest_launch.rocket.first_stage.cores.first.block # 5
latest_launch.rocket.first_stage.cores.first.reused # true
latest_launch.rocket.first_stage.cores.first.land_success # true
latest_launch.rocket.first_stage.cores.first.landing_type # 'ASDS'
latest_launch.rocket.first_stage.cores.first.landing_vehicle # 'OCISLY'
latest_launch.rocket.second_stage.block # 5
latest_launch.rocket.second_stage.payloads.first.payload_id # 'Telkom-4'
latest_launch.rocket.second_stage.payloads.first.norad_id.first # 43_587
latest_launch.rocket.second_stage.payloads.first.reused # false
latest_launch.rocket.second_stage.payloads.first.customers.first # 'Telkom'
latest_launch.rocket.second_stage.payloads.first.nationality # 'Indonesia'
latest_launch.rocket.second_stage.payloads.first.manufacturer # 'SSL'
latest_launch.rocket.second_stage.payloads.first.payload_type # 'Satellite'
latest_launch.rocket.second_stage.payloads.first.payload_mass_kg # 5800
latest_launch.rocket.second_stage.payloads.first.payload_mass_lbs # 12_786.81
latest_launch.rocket.second_stage.payloads.first.orbit # 'GTO'
latest_launch.rocket.second_stage.payloads.first.orbit_params.reference_system # 'geocentric'
latest_launch.rocket.second_stage.payloads.first.orbit_params.regime # 'geostationary'
latest_launch.rocket.second_stage.payloads.first.orbit_params.longitude # -108
latest_launch.rocket.second_stage.payloads.first.orbit_params.semi_major_axis_km # 21_226.178
latest_launch.rocket.second_stage.payloads.first.orbit_params.eccentricity # 0.6904141
latest_launch.rocket.second_stage.payloads.first.orbit_params.periapsis_km # 193.19
latest_launch.rocket.second_stage.payloads.first.orbit_params.apoapsis_km # 29_502.896
latest_launch.rocket.second_stage.payloads.first.orbit_params.inclination_deg # 27.0648
latest_launch.rocket.second_stage.payloads.first.orbit_params.period_min # 512.941
latest_launch.rocket.second_stage.payloads.first.orbit_params.lifespan_years # 15
latest_launch.rocket.second_stage.payloads.first.orbit_params.epoch # '2018-08-07T06:57:16.000Z'
latest_launch.rocket.second_stage.payloads.first.orbit_params.mean_motion # 2.80734018
latest_launch.rocket.second_stage.payloads.first.orbit_params.raan # 227.0228
latest_launch.telemetry.flight_club # nil
latest_launch.reuse.core # true
latest_launch.reuse.sire_core1 # nil
latest_launch.reuse.side_core2 # false
latest_launch.reuse.fairings # false
latest_launch.reuse.capsule # false
latest_launch.launch_site.site_id # 'ccafs_slc_40'
latest_launch.launch_site.site_name # 'CCAFS SLC 40'
latest_launch.launch_site.site_name_long # 'Cape Canaveral Air Force Station Space Launch Complex 40'
latest_launch.launch_success # true
latest_launch.links.mission_patch # 'https://images2.imgbox.com/a8/f5/ZgdsrbqW_o.png'
latest_launch.links.mision_patch_small # nil
latest_launch.links.reddit_campaign # 'https://www.reddit.com/r/spacex/comments/91gwfg/merah_putih_telkom4_launch_campaign_thread/'
latest_launch.links.reddit_launch # 'https://www.reddit.com/r/spacex/comments/9539nr/rspacex_merah_putih_telkom4_official_launch/'
latest_launch.links.reddit_recovery # nil
latest_launch.links.reddit_media # 'https://www.reddit.com/r/spacex/comments/94zr0b/rspacex_merah_putih_media_thread_videos_images/'
latest_launch.links.presskit # 'https://www.spacex.com/sites/spacex/files/merahputihpresskit.pdf'
latest_launch.links.article_link # 'https://spaceflightnow.com/2018/08/07/indonesian-communications-satellite-deployed-in-orbit-by-spacex/'
latest_launch.links.wikipedia # 'https://en.wikipedia.org/wiki/Telkom_Indonesia'
latest_launch.links.video_link # 'https://www.youtube.com/watch?v=FjfQNBYv2IY'
latest_launch.details # 'Indonesian comsat intended to replace the aging Telkom 1 at 108° E. First reflight of a Block 5-version booster.'
latest_launch.upcoming # false
latest_launch.static_fire_date_utc # '2018-08-02T15:53:00.000Z'
```


### Company Info

```ruby
company_info = SPACEX::CompanyInfo.info

company_info.name # 'SpaceX'
company_info.founder # 'Elon Musk'
company_info.founded # 2002
company_info.employees # 7000
company_info.vehicles # 3
company_info.launche_sites # nil
company_info.test_sites # 1
company_info.ceo # 'Elon Musk'
company_info.cto # 'Elon Musk'
company_info.coo # 'Gwynne Shotwell'
company_info.cto_propulsion # 'Tom Mueller'
company_info.valuation # 15_000_000_000
company_info.headquarters.address # 'Rocket Road'
company_info.headquarters.city # 'Hawthorne'
company_info.headquarters.state # 'California'
company_info.summary # 'SpaceX designs, manufactures and launches advanced rockets and spacecraft. The company was founded in 2002 to revolutionize space technology, with the ultimate goal of enabling people to live on other planets.'
```

### Roadster

```ruby
roadster = SPACEX::Roadster.info

roadster.name # "Elon Musk's Tesla Roadster"
roadster.launch_date_utc # '2018-02-06T20:45:00.000Z'
roadster.launch_date_unix # 1_517_949_900
roadster.launch_date_kg # nil
roadster.launch_date_lbs # nil
roadster.norad_id # 43_205
roadster.epoch_jd # 2_458_353.027800926
roadster.orbit_type # 'heliocentric'
roadster.apoapsis_au # 1.663757412460597
roadster.periapsis_au # 0.9860953641129515
roadster.semo_major_axis_au # nil
roadster.eccentricity # 0.2557357353354217
roadster.inclination # 1.077474057737451
roadster.longitude # 317.0962040947829
roadster.periapsis_arg # 177.491390597234
roadster.speed_kph # 76_703.72399999999
roadster.speed_mph # 47_661.469685603995
roadster.earth_distance_km # 172_954_806.23899576
roadster.earth_distance_mi # 107_469_100.90753104
roadster.mars_distance_km # 147_648_108.6344399
roadster.mars_distance_mi # 91_744_252.91029055
roadster.wikipedia # 'https://en.wikipedia.org/wiki/Elon_Musk%27s_Tesla_Roadster'
roadster.details # "Elon Musk's Tesla Roadster is an electric sports car that served as the dummy payload for the February 2018 Falcon Heavy test flight and is now an artificial satellite of the Sun. Starman, a mannequin dressed in a spacesuit, occupies the driver's seat. The car and rocket are products of Tesla and SpaceX, both companies founded by Elon Musk. This 2008-model Roadster was previously used by Musk for commuting, and is the only consumer car sent into space."
```

### Dragon Capsules

```ruby
dragon_capsules = SPACEX::DragonCapsules.info

dragon_capsules[0]['id'] # "dragon1"
dragon_capsules[0]['name'] # "Dragon 1"
dragon_capsules[0]['type'] # "capsule"
dragon_capsules[0]['active'] # true
dragon_capsules[0]['crew_capacity'] # 0
dragon_capsules[0]['sidewall_angle_deg'] # 15
dragon_capsules[0]['orbit_duration_yr'] # 2
dragon_capsules[0]['dry_mass_kg'] # 4200
dragon_capsules[0]['dry_mass_lb'] # 9300
dragon_capsules[0]['first_flight'] # "2010-12-08"
dragon_capsules[0]['heat_shield']['material'] # "PICA-X"
dragon_capsules[0]['heat_shield']['size_meters'] # 3.6
dragon_capsules[0]['heat_shield']['temp_degrees'] # 3000
dragon_capsules[0]['heat_shield']['dev_partner'] # "NASA"
dragon_capsules[0]['thrusters'][0]['type'] # "Draco"
dragon_capsules[0]['thrusters'][0]['amount'] # 18
dragon_capsules[0]['thrusters'][0]['pods'] # 4
dragon_capsules[0]['thrusters'][0]['fuel_1'] # "nitrogen tetroxide"
dragon_capsules[0]['thrusters'][0]['fuel_2'] # "monomethylhydrazine"
dragon_capsules[0]['thrusters'][0]['thrust']['kN'] # 0.4
dragon_capsules[0]['thrusters'][0]['thrust']['lbf'] # 90
dragon_capsules[0]['launch_payload_mass']['kg'] # 6000
dragon_capsules[0]['launch_payload_mass']['lb'] # 13228
dragon_capsules[0]['launch_payload_vol']['cubic_meters'] # 25
dragon_capsules[0]['launch_payload_vol']['cubic_feet'] # 883
dragon_capsules[0]['return_payload_mass']['kg'] # 3000
dragon_capsules[0]['return_payload_mass']['lb'] # 6614
dragon_capsules[0]['return_payload_vol']['cubic_meters'] # 11
dragon_capsules[0]['return_payload_vol']['cubic_feet'] # 388
dragon_capsules[0]['pressurized_capsule']['payload_volume']['cubic_meters']) # 11
dragon_capsules[0]['pressurized_capsule']['payload_volume']['cubic_feet'] # 388
dragon_capsules[0]['trunk']['trunk_volume']['cubic_meters'] # 14
dragon_capsules[0]['trunk']['trunk_volume']['cubic_feet'] # 494
dragon_capsules[0]['trunk']['cargo']['solar_array'] # 2
dragon_capsules[0]['trunk']['cargo']['unpressurized_cargo'] # true
dragon_capsules[0]['height_w_trunk']['meters'] # 7.2
dragon_capsules[0]['height_w_trunk']['feet'] # 23.6
dragon_capsules[0]['diameter']['meters'] # 3.7
dragon_capsules[0]['diameter']['feet'] # 12
dragon_capsules[0]['wikipedia'] # "https://en.wikipedia.org/wiki/SpaceX_Dragon"
dragon_capsules[0]['description'] # "Dragon is a reusable spacecraft developed by SpaceX, an American private space transportation company based in Hawthorne, California. Dragon is launched into space by the SpaceX Falcon 9 two-stage-to-orbit launch vehicle. The Dragon spacecraft was originally designed for human travel, but so far has only been used to deliver cargo to the International Space Station (ISS)."

dragon_capsules[1]['id'] # "dragon2"
dragon_capsules[1]['name'] # "Dragon 2"
dragon_capsules[1]['type'] # "capsule"
dragon_capsules[1]['active'] # false
dragon_capsules[1]['crew_capacity'] # 7
dragon_capsules[1]['sidewall_angle_deg'] # 15
dragon_capsules[1]['orbit_duration_yr'] # 2
dragon_capsules[1]['dry_mass_kg'] # 6350
dragon_capsules[1]['dry_mass_lb'] # 14000
dragon_capsules[1]['first_flight'] # "2018-11-01"
dragon_capsules[1]['heat_shield']['material'] # "PICA-X"
dragon_capsules[1]['heat_shield']['size_meters'] # 3.6
dragon_capsules[1]['heat_shield']['temp_degrees'] # 3000
dragon_capsules[1]['heat_shield']['dev_partner'] # "NASA"
dragon_capsules[1]['thrusters'][0]['type'] # "Draco"
dragon_capsules[1]['thrusters'][0]['amount']) #18
dragon_capsules[1]['thrusters'][0]['pods'] # 4
dragon_capsules[1]['thrusters'][0]['fuel_1'] # "nitrogen tetroxide"
dragon_capsules[1]['thrusters'][0]['fuel_2'] # "monomethylhydrazine"
dragon_capsules[1]['thrusters'][0]['thrust']['kN'] # 0.4
dragon_capsules[1]['thrusters'][0]['thrust']['lbf'] # 90
dragon_capsules[1]['thrusters'][1]['type'] # "SuperDraco"
dragon_capsules[1]['thrusters'][1]['amount'] # 8
dragon_capsules[1]['thrusters'][1]['pods'] # 4
dragon_capsules[1]['thrusters'][1]['fuel_1'] # "dinitrogen tetroxide"
dragon_capsules[1]['thrusters'][1]['fuel_2'] # "monomethylhydrazine"
dragon_capsules[1]['thrusters'][1]['thrust']['kN'] # 71
dragon_capsules[1]['thrusters'][1]['thrust']['lbf'] # 16000
dragon_capsules[1]['launch_payload_mass']['kg'] # 6000
dragon_capsules[1]['launch_payload_mass']['lb'] # 13228
dragon_capsules[1]['launch_payload_vol']['cubic_meters'] # 25
dragon_capsules[1]['launch_payload_vol']['cubic_feet'] # 883
dragon_capsules[1]['return_payload_mass']['kg'] # 3000
dragon_capsules[1]['return_payload_mass']['lb'] # 6614
dragon_capsules[1]['return_payload_vol']['cubic_meters'] # 11
dragon_capsules[1]['return_payload_vol']['cubic_feet'] # 388
dragon_capsules[1]['pressurized_capsule']['payload_volume']['cubic_meters'] # 11
dragon_capsules[1]['pressurized_capsule']['payload_volume']['cubic_feet'] # 388
dragon_capsules[1]['trunk']['trunk_volume']['cubic_meters'] # 14
dragon_capsules[1]['trunk']['trunk_volume']['cubic_feet'] # 494
dragon_capsules[1]['trunk']['cargo']['solar_array'] # 2
dragon_capsules[1]['trunk']['cargo']['unpressurized_cargo'] # true
dragon_capsules[1]['height_w_trunk']['meters'] # 7.2
dragon_capsules[1]['height_w_trunk']['feet'] # 23.6
dragon_capsules[1]['diameter']['meters'] # 3.7
dragon_capsules[1]['diameter']['feet'] # 12
dragon_capsules[1]['wikipedia'] # "https://en.wikipedia.org/wiki/Dragon_2"
dragon_capsules[1]['description'] # "Dragon 2 (also Crew Dragon, Dragon V2, or formerly DragonRider) is the second version of the SpaceX Dragon spacecraft, which will be a human-rated vehicle. It includes a set of four side-mounted thruster pods with two SuperDraco engines each, which can serve as a launch escape system or launch abort system (LAS). In addition, it has much larger windows, new flight computers and avionics, and redesigned solar arrays, and a modified outer mold line from the initial cargo Dragon that has been flying for several years."

```

### Missions

```ruby
missions = SPACEX::Missions.all

missions[0]['mission_name'] # "Iridium NEXT"
missions[0]['mission_id'] # "F3364BF"
missions[0]['manufacturers'] # ["Orbital ATK"]
missions[0]['payload_ids'] # ["Iridium NEXT 1", "Iridium NEXT 2", "Iridium NEXT 3", "Iridium NEXT 4", "Iridium NEXT 5", "Iridium NEXT 6", "Iridium NEXT 7"]
missions[0]['wikipedia'] # "https://en.wikipedia.org/wiki/Iridium_satellite_constellation"
missions[0]['website'] # "https://www.iridiumnext.com/"
missions[0]['twitter'] # "https://twitter.com/IridiumBoss?lang=en"
missions[0]['description'] # "In 2017, Iridium began launching Iridium NEXT, a second-generation worldwide network of telecommunications satellites, consisting of 66 active satellites, with another nine in-orbit spares and six on-ground spares. These satellites will incorporate features such as data transmission that were not emphasized in the original design. The constellation will provide L-band data speeds of up to 128 kbit/s to mobile terminals, up to 1.5 Mbit/s to Iridium Pilot marine terminals, and high-speed Ka-band service of up to 8 Mbit/s to fixed/transportable terminals. The next-generation terminals and service are expected to be commercially available by the end of 2018. However, Iridium's proposed use of its next-generation satellites has raised concerns the service will harmfully interfere with GPS devices. The satellites will incorporate a secondary payload for Aireon, a space-qualified ADS-B data receiver. This is for use by air traffic control and, via FlightAware, for use by airlines. A tertiary payload on 58 satellites is a marine AIS ship-tracker receiver, for Canadian company exactEarth Ltd. Iridium can also be used to provide a data link to other satellites in space, enabling command and control of other space assets regardless of the position of ground stations and gateways."
```

## Contributing

Want to help? Create an issue, open a pull request. Any help is welcome.


## Copyright

Copyright (c) Rodolfo Bandeira, 2018

MIT License, see [LICENSE](https://github.com/rodolfobandeira/spacex/blob/master/LICENSE) for details.
