SpaceX Ruby Client
===============

[![Gem Version](https://badge.fury.io/rb/spacex.svg)](https://badge.fury.io/rb/spacex)
[![Build Status](https://travis-ci.com/rodolfobandeira/spacex.svg?branch=master)](https://travis-ci.org/rodolfobandeira/spacex)
[![Coverage Status](https://coveralls.io/repos/github/rodolfobandeira/spacex/badge.svg?branch=master)](https://coveralls.io/github/rodolfobandeira/spacex?branch=master)

A Ruby library that consumes the [SpaceX API](https://github.com/r-spacex/SpaceX-API).


## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Capsules](#capsules)
    - `SPACEX::Capsules.info`
    - `SPACEX::Capsules.info('capsule_serial')`
  - [Company Info](#company-info) - `SPACEX::CompanyInfo.info`
  - [Cores](#cores)
    - `SPACEX::Cores.info`
    - `SPACEX::Cores.info('core_serial')`
  - [Dragon Capsules](#dragon-capsules)
    - `SPACEX::DragonCapsules.info`
    - `SPACEX::DragonCapsules.info('dragon_id')`
  - [Launches](#launches)
    - `SPACEX::Launches.info`
    - `SPACEX::Launches.latest`
    - `SPACEX::Launches.next`
  - [Missions](#missions)
    - `SPACEX::Missions.info`
    - `SPACEX::Missions.info('mission_id')`
  - [Roadster](#roadster) - `SPACEX::Roadster.info`
  - [Rockets](#rockets)
    - `SPACEX::Rockets.info`
    - `SPACEX::Rockets.info('falcon1')`
  - [Ships](#ships)
    - `SPACEX::Ships.info`
    - `SPACEX::Ships.info('ship_id')`
- [Contributing](#contributing)
- [Copyright](#copyright)


## Installation

Add the gem to your Gemfile:

```
gem 'spacex'
```

Then run `bundle install`.


## Usage

### Capsules

- Get information for all capsules: `SPACEX::Capsules.info`
- Get information about a specific capsule: `SPACEX::Capsules.info('capsule_serial')`

This example shows how to get capsule information and what the data fields are for that object:

```ruby
capsules_info = SPACEX::Capsules.info

capsules_info.first.capsule_id # 'dragon2'
capsules_info.first.capsule_serial # 'C201'
capsules_info.first.details # 'Pressure vessel used for Dragon 2 structural testing. Rumored to be repurposed for first Red Dragon Mission'
capsules_info.first.landings # 0
capsules_info.first.missions # []
capsules_info.first.original_launch # nil capsules_info.first.original_launch_unix # nil
capsules_info.first.status # 'active'
capsules_info.first.type # 'Dragon 2.0'
```

### Company Info

- Get information about the company: `SPACEX::CompanyInfo.info`

Here is an example of the company information:

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

### Cores

- Get information for all cores: `SPACEX::Cores.info`
- Get information about a specific core: `SPACEX::Cores.info('core_serial')`

The following code snippet shows how to get the cores information and what the data fields are for a single core:

```ruby
cores_info = SPACEX::Cores.info

cores_info.first.asds_attempts # 0
cores_info.first.asds_landings # 0
cores_info.first.block # 5
cores_info.first.core_serial # 'B1052'
cores_info.first.details # 'On test stand at McGregor'
cores_info.first.missions # []
cores_info.first.original_launch # nil
cores_info.first.original_launch_unix # nil
cores_info.first.rtls_attempts # 0
cores_info.first.rtls_landings # 0
cores_info.first.status # 'active'
cores_info.first.water_landing # false
```

### Dragon Capsules

- Get all dragon capsules: `SPACEX::DragonCapsules.info`
- Get a specific dragon capsule (e.g., `dragon1`) by including the id in the call: `SPACEX::DragonCapsules.info('dragon_id')`

This code snippet shows the `dragon1` dragon capsule information:

```ruby
dragon_capsules = SPACEX::DragonCapsules.info

dragon_capsules.first.capsule_id # "dragon1"
dragon_capsules.first.name # "Dragon 1"
dragon_capsules.first.type # "capsule"
dragon_capsules.first.active # true
dragon_capsules.first.crew_capacity # 0
dragon_capsules.first.sidewall_angle_deg # 15
dragon_capsules.first.orbit_duration_yr # 2
dragon_capsules.first.dry_mass_kg # 4200
dragon_capsules.first.dry_mass_lb # 9300
dragon_capsules.first.first_flight # "2010-12-08"
dragon_capsules.first.heat_shield['material'] # "PICA-X"
dragon_capsules.first.heat_shield['size_meters'] # 3.6
dragon_capsules.first.heat_shield['temp_degrees'] # 3000
dragon_capsules.first.heat_shield['dev_partner'] # "NASA"
dragon_capsules.first.thrusters[0]['type'] # "Draco"
dragon_capsules.first.thrusters[0]['amount'] # 18
dragon_capsules.first.thrusters[0]['pods'] # 4
dragon_capsules.first.thrusters[0]['fuel_1'] # "nitrogen tetroxide"
dragon_capsules.first.thrusters[0]['fuel_2'] # "monomethylhydrazine"
dragon_capsules.first.thrusters[0]['thrust']['kN'] # 0.4
dragon_capsules.first.thrusters[0]['thrust']['lbf'] # 90
dragon_capsules.first.launch_payload_mass['kg'] # 6000
dragon_capsules.first.launch_payload_mass['lb'] # 13228
dragon_capsules.first.launch_payload_vol['cubic_meters'] # 25
dragon_capsules.first.launch_payload_vol['cubic_feet'] # 883
dragon_capsules.first.return_payload_mass['kg'] # 3000
dragon_capsules.first.return_payload_mass['lb'] # 6614
dragon_capsules.first.return_payload_vol['cubic_meters'] # 11
dragon_capsules.first.return_payload_vol['cubic_feet'] # 388
dragon_capsules.first.pressurized_capsule['payload_volume']['cubic_meters']) # 11
dragon_capsules.first.pressurized_capsule['payload_volume']['cubic_feet'] # 388
dragon_capsules.first.trunk['trunk_volume['cubic_meters'] # 14
dragon_capsules.first.trunk['trunk_volume['cubic_feet'] # 494
dragon_capsules.first.trunk['cargo']['solar_array'] # 2
dragon_capsules.first.trunk['cargo']['unpressurized_cargo'] # true
dragon_capsules.first.height_w_trunk['meters'] # 7.2
dragon_capsules.first.height_w_trunk['feet'] # 23.6
dragon_capsules.first.diameter['meters'] # 3.7
dragon_capsules.first.diameter['feet'] # 12
dragon_capsules.first.wikipedia # "https://en.wikipedia.org/wiki/SpaceX_Dragon"
dragon_capsules.first.description # "Dragon is a reusable spacecraft developed by SpaceX, an American private space transportation company based in Hawthorne, California. Dragon is launched into space by the SpaceX Falcon 9 two-stage-to-orbit launch vehicle. The Dragon spacecraft was originally designed for human travel, but so far has only been used to deliver cargo to the International Space Station (ISS)."
```

### Launches

- Get information on all launches: `SPACEX::Launches.info`
- Get information on the next launch: `SPACEX::Launches.next`
- Get the latest launch information: `SPACEX::Launches.latest`

The following code snippet shows the latest launch information and the data fields available on the Launch object:
 
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

### Missions

- Get all mission information: `SPACEX::Missions.info`
- Get information about a specific mission (e.g., `F3364BF`): `SPACEX::Missions.info('mission_id')`

This code shows how to get the first mission information and lists the fields:

```ruby
missions = SPACEX::Missions.info

missions.first.mission_id # "F3364BF"
missions.first.mission_name # "Iridium NEXT"
missions.first.manufacturers # ["Orbital ATK"]
missions.first.payload_ids # ["Iridium NEXT 1", "Iridium NEXT 2", "Iridium NEXT 3", "Iridium NEXT 4", "Iridium NEXT 5", "Iridium NEXT 6", "Iridium NEXT 7"]
missions.first.wikipedia # "https://en.wikipedia.org/wiki/Iridium_satellite_constellation"
missions.first.website # "https://www.iridiumnext.com/"
missions.first.twitter # "https://twitter.com/IridiumBoss?lang=en"
missions.first.description # "In 2017, Iridium began launching Iridium NEXT, a second-generation worldwide network of telecommunications satellites, consisting of 66 active satellites, with another nine in-orbit spares and six on-ground spares. These satellites will incorporate features such as data transmission that were not emphasized in the original design. The constellation will provide L-band data speeds of up to 128 kbit/s to mobile terminals, up to 1.5 Mbit/s to Iridium Pilot marine terminals, and high-speed Ka-band service of up to 8 Mbit/s to fixed/transportable terminals. The next-generation terminals and service are expected to be commercially available by the end of 2018. However, Iridium's proposed use of its next-generation satellites has raised concerns the service will harmfully interfere with GPS devices. The satellites will incorporate a secondary payload for Aireon, a space-qualified ADS-B data receiver. This is for use by air traffic control and, via FlightAware, for use by airlines. A tertiary payload on 58 satellites is a marine AIS ship-tracker receiver, for Canadian company exactEarth Ltd. Iridium can also be used to provide a data link to other satellites in space, enabling command and control of other space assets regardless of the position of ground stations and gateways."
```

### Roadster

- Get roadster orbital data: `SPACEX::Roadster.info`

The following code shows how to get information about the Roadster:

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

### Rockets

- Get information for all rockets: `SPACEX::Rockets.info`
- Get information about a specific rocket (e.g., `falcon1`: `SPACEX::Rockets.info('falcon1')`

This example shows a single rocket and its data fields:

```
rockets = SPACEX::Rockets.info
first_rocket = rockets.first

first_rocket.id # 1
first_rocket.active # false
first_rocket.stages # 2
first_rocket.boosters # 0
first_rocket.cost_per_launch # 6700000
first_rocket.success_rate_pct # 40
first_rocket.first_flight # "2006-03-24"
first_rocket.country # "Republic of the Marshall Islands"
first_rocket.company # "SpaceX"
first_rocket.height # {"meters"=>22.25, "feet"=>73}
first_rocket.diameter # {"meters"=>1.68, "feet"=>5.5}
first_rocket.mass # {"kg"=>30146, "lb"=>66460}
first_rocket.payload_weights # [{"id"=>"leo", "name"=>"Low Earth Orbit", "kg"=>450, "lb"=>992}]
first_rocket.first_stage # {"reusable"=>false, "engines"=>1, "fuel_amount_tons"=>44.3, "burn_time_sec"=>169, "thrust_sea_level"=>{"kN"=>420, "lbf"=>94000}, "thrust_vacuum"=>{"kN"=>480, "lbf"=>110000}}
first_rocket.second_stage # {"engines"=>1, "fuel_amount_tons"=>3.38, "burn_time_sec"=>378, "thrust"=>{"kN"=>31, "lbf"=>7000}, "payloads"=>{"option_1"=>"composite fairing", "composite_fairing"=>{"height"=>{"meters"=>3.5, "feet"=>11.5}, "diameter"=>{"meters"=>1.5, "feet"=>4.9}}}}
first_rocket.engines # {"number"=>1, "type"=>"merlin", "version"=>"1C", "layout"=>"single", "engine_loss_max"=>0, "propellant_1"=>"liquid oxygen", "propellant_2"=>"RP-1 kerosene", "thrust_sea_level"=>{"kN"=>420, "lbf"=>94000}, "thrust_vacuum"=>{"kN"=>480, "lbf"=>110000}, "thrust_to_weight"=>96}
first_rocket.landing_legs # {"number"=>0, "material"=>nil}
first_rocket.wikipedia # "https://en.wikipedia.org/wiki/Falcon_1"
first_rocket.description # "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth."
first_rocket.rocket_id # "falcon1"
first_rocket.rocket_name # "Falcon 1"
first_rocket.rocket_type # "rocket"
```

### Ships

- Get all ship information: `SPACEX::Ships.info`
- Get information about a specific ship (e.g., `AMERICANCHAMPION`): `SPACEX::Ships.info('ship_id')`

The following code shows how to get information about a specific ship and lists the ship data fields:

```ruby
ship = SPACEX::Ships.info('AMERICANCHAMPION')

ship.ship_id # 'AMERICANCHAMPION'
ship.ship_name # 'American Champion'
ship.ship_model # nil
ship.ship_type # 'Tug'
ship.roles # ['Support Ship', 'Barge Tug']
ship.active # false
ship.imo # 7_434_016
ship.mmsi # 367_020_820
ship.abs # 571_252
ship.ship_class # 7_604_342 # Call as array since "class" is a method in Ruby
ship.weight_lbs # 588_000
ship.weight_kg # 266_712
ship.year_built # 1976
ship.home_port # 'Port of Los Angeles'
ship.status # 'Stopped'
ship.speed_kn # 0
ship.course_deg # nil
ship.position # ({ 'latitude' => 30.52852, 'longitude' => -88.09869 })
ship.successful_landings # nil
ship.attempted_landings # nil
ship.missions # [{ 'flight' => 7, 'name' => 'COTS 1' }, { 'flight' => 8, 'name' => 'COTS 2' }]
ship.url # 'https://www.marinetraffic.com/en/ais/details/ships/shipid:434663/vessel:AMERICAN%20CHAMPION'
ship.image # 'https://i.imgur.com/woCxpkj.jpg'
```


## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).

[List of awesome people that already helped this project](CHANGELOG.md).


## Copyright

Copyright (c) 2018, [Rodolfo Bandeira](https://twitter.com/rodolfobandeira) and [Contributors](CHANGELOG.md).

MIT License, see [LICENSE](https://github.com/rodolfobandeira/spacex/blob/master/LICENSE) for details.
