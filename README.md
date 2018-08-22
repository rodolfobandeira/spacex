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

## Contributing

Want to help? Create an issue, open a pull request. Any help is welcome.


## Copyright

Copyright (c) Rodolfo Bandeira, 2018

MIT License, see [LICENSE](https://github.com/rodolfobandeira/spacex/blob/master/LICENSE) for details.
