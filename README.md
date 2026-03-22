SpaceX Ruby Client
===============

[![Gem Version](https://badge.fury.io/rb/spacex.svg)](https://badge.fury.io/rb/spacex)
[![Tests](https://github.com/rodolfobandeira/spacex/actions/workflows/ruby.yml/badge.svg)](https://github.com/rodolfobandeira/spacex/actions/workflows/ruby.yml)

A Ruby library that consumes the [SpaceX API](https://github.com/r-spacex/SpaceX-API).


## Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
  - [Launches](#launches)
  - [Rockets](#rockets)
  - [Starlink](#starlink)
- [Available Resources](#available-resources)
- [Contributing](#contributing)
- [Copyright](#copyright)


## Installation

Add the gem to your Gemfile:

```
gem 'spacex'
```

Then run `bundle install`.


## Quick Start

### Launches

```ruby
# Get the latest launch
launch = SPACEX::Launches.latest
launch.name        # "Starlink 6-14"
launch.date_utc    # "2023-09-08T02:47:00.000Z"
launch.success     # true
launch.details     # "..."

# Get upcoming launches
upcoming = SPACEX::Launches.upcoming
upcoming.first.name     # "Starlink 7-1"
upcoming.first.date_utc # "2024-01-15T00:00:00.000Z"
```

Also available: `SPACEX::Launches.info`, `SPACEX::Launches.next`, `SPACEX::Launches.past`.

### Rockets

```ruby
# Get all rockets
rockets = SPACEX::Rockets.info
rockets.first.name      # "Falcon 1"
rockets.first.active    # false

# Get a specific rocket by ID
falcon9 = SPACEX::Rockets.info('5e9d0d95eda69973a809d1ec')
falcon9.name            # "Falcon 9"
falcon9.active          # true
falcon9.cost_per_launch # 50_000_000
```

### Starlink

```ruby
# Get all Starlink satellites
satellites = SPACEX::Starlink.info
satellites.first.latitude     # 53.0   (illustrative — live data will differ)
satellites.first.longitude    # -94.0
satellites.first.height_km    # 550.6
satellites.first.velocity_kms # 7.66
```


## Available Resources

All resources live under the `SPACEX::` namespace and support `.info` and `.info('id')`.

| Resource | Notes |
|---|---|
| `SPACEX::Capsules` | |
| `SPACEX::Company` | Single object — `.info` only |
| `SPACEX::Cores` | |
| `SPACEX::Crew` | |
| `SPACEX::Dragons` | |
| `SPACEX::History` | |
| `SPACEX::Landpads` | |
| `SPACEX::Launches` | Also: `.latest`, `.next`, `.past`, `.upcoming` |
| `SPACEX::Launchpads` | |
| `SPACEX::Payloads` | |
| `SPACEX::Roadster` | Single object — `.info` only |
| `SPACEX::Rockets` | |
| `SPACEX::Ships` | |
| `SPACEX::Starlink` | |


## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).

[List of awesome people that already helped this project](CHANGELOG.md).

[![Contributors](https://contrib.rocks/image?repo=rodolfobandeira/spacex)](https://github.com/rodolfobandeira/spacex/graphs/contributors)


## Copyright

Copyright (c) 2018, [Rodolfo Bandeira](https://x.com/rodolfobandeira) and [Contributors](CHANGELOG.md).

MIT License, see [LICENSE](https://github.com/rodolfobandeira/spacex/blob/master/LICENSE) for details.
