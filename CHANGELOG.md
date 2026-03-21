# Changelog

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [2.0.0] - 2026-03-21

### Breaking Changes

- `SPACEX::V4::*` namespace removed; use `SPACEX::*` directly
- V3-only endpoints removed entirely: `SPACEX::ApiInfo`, `SPACEX::Missions`,
  `SPACEX::DragonCapsules`
- `SPACEX::Launches` now uses `/v4/launches` (different schema from V3)
- `SPACEX::Launches.all` removed (was a V3 alias; not carried forward)
- `SPACEX::LandingPads` renamed to `SPACEX::Landpads` (matches V4 path `/v4/landpads`)
- `SPACEX::LaunchPads` renamed to `SPACEX::Launchpads` (matches V4 path `/v4/launchpads`)
- `SPACEX::CompanyInfo` renamed to `SPACEX::Company` (matches V4 path `/v4/company`)
- `BaseRequest.info` no longer accepts a `version` parameter — always calls `/v4/`
- All `.info(id, _query = {})` signatures reduced to `.info(id = nil)` only

### Added

- `SPACEX::Company` — V4 company endpoint (replaces `SPACEX::CompanyInfo`)
- `SPACEX::Crew` — V4 crew endpoint with typed properties
- `SPACEX::Dragons` — new V4 dragons endpoint
- `SPACEX::History` — V4 history endpoint (replaces V3 version)
- `SPACEX::Landpads` — new V4 landpads endpoint
- `SPACEX::Launchpads` — new V4 launchpads endpoint
- `SPACEX::Payloads` — V4 payloads endpoint (replaces V3 version)
- `SPACEX::Roadster` — V4 roadster endpoint (replaces V3 version)
- `SPACEX::Rockets` — V4 rockets with typed properties (replaces V3/V4 version)
- `SPACEX::Ships` — V4 ships endpoint (replaces V3 version)
- `SPACEX::Starlink` — new V4 starlink endpoint
