# SpaceX Gem 2.0 — V4 Namespace Consolidation

**Date:** 2026-03-21
**Status:** Approved

## Summary

The gem currently has two parallel API implementations: a legacy V3 layer (modules with dynamic Hashie::Mash responses) and an incomplete V4 layer (`SPACEX::V4::*` classes with explicit property declarations). V3 is fully deprecated by the SpaceX API. This spec describes consolidating to a single, clean V4-only interface at gem version 2.0.0.

## Goals

- Single unified namespace: `SPACEX::<Resource>` — no version prefix exposed to users
- All 14 active V4 endpoints implemented
- Explicit property declarations via `Hashie::Trash` for typed responses
- Clean 2.0.0 breaking release — no backwards compatibility shims

## Breaking Changes

- `SPACEX::V4::*` namespace removed; use `SPACEX::*` instead
- All V3 endpoints removed: `ApiInfo`, `Missions`, `DragonCapsules` (no V4 equivalent)
- `SPACEX::Launches` now points to `/v4/launches` (different schema from V3)
- `BaseRequest.info` no longer accepts a `version` parameter

## Architecture

### HTTP Layer

`BaseRequest.info(path, klass = nil)` — version parameter dropped, always calls `/v4/`. No other changes to the request pipeline.

### Resource Base Class

All endpoints inherit from `SPACEX::Resource` (`Hashie::Trash` + `IgnoreUndeclared`). Endpoints that return a single schema-less object (`Company`, `Roadster`) use `SPACEX::Response` (Hashie::Mash) directly.

### Endpoint Inventory

| Class | Path | Special methods |
|---|---|---|
| `SPACEX::Capsules` | `/v4/capsules` | `.info`, `.info(id)` |
| `SPACEX::Company` | `/v4/company` | `.info` (single object) |
| `SPACEX::Cores` | `/v4/cores` | `.info`, `.info(id)` |
| `SPACEX::Crew` | `/v4/crew` | `.info`, `.info(id)` |
| `SPACEX::Dragons` | `/v4/dragons` | `.info`, `.info(id)` |
| `SPACEX::History` | `/v4/history` | `.info`, `.info(id)` |
| `SPACEX::Landpads` | `/v4/landpads` | `.info`, `.info(id)` |
| `SPACEX::Launches` | `/v4/launches` | `.info`, `.info(id)`, `.latest`, `.next`, `.past`, `.upcoming` |
| `SPACEX::Launchpads` | `/v4/launchpads` | `.info`, `.info(id)` |
| `SPACEX::Payloads` | `/v4/payloads` | `.info`, `.info(id)` |
| `SPACEX::Roadster` | `/v4/roadster` | `.info` (single object) |
| `SPACEX::Rockets` | `/v4/rockets` | `.info`, `.info(id)` |
| `SPACEX::Ships` | `/v4/ships` | `.info`, `.info(id)` |
| `SPACEX::Starlink` | `/v4/starlink` | `.info`, `.info(id)` |

## File Structure

### Lib

```
lib/spacex/
  base_request.rb       # remove version param, always /v4/
  resource.rb           # unchanged
  models.rb             # autoloads all 14 endpoints, drops V4 module
  version.rb            # bump to 2.0.0
  capsules.rb           # moved from v4/capsules.rb
  company.rb            # moved from v4/company.rb
  cores.rb              # moved from v4/cores.rb
  crew.rb               # moved from v4/crew.rb
  dragons.rb            # new
  history.rb            # new
  landpads.rb           # new
  launches.rb           # replaced (V4 schema)
  launchpads.rb         # new
  payloads.rb           # new
  roadster.rb           # replaced (V4 schema)
  rockets.rb            # moved from v4/rockets.rb
  ships.rb              # new
  starlink.rb           # new
```

Files deleted: `lib/spacex/v4/` (entire directory), plus all old V3 files replaced above.

### Specs

```
spec/spacex/
  capsules_spec.rb
  company_spec.rb
  cores_spec.rb
  crew_spec.rb
  dragons_spec.rb
  history_spec.rb
  landpads_spec.rb
  launches_spec.rb
  launchpads_spec.rb
  payloads_spec.rb
  roadster_spec.rb
  rockets_spec.rb
  ships_spec.rb
  starlink_spec.rb
spec/fixtures/spacex/v4/
  (one VCR cassette per endpoint)
```

Directory deleted: `spec/spacex/v4/` (old V4 specs).

## Testing

- VCR cassettes record real HTTP responses; existing v4 cassettes for Capsules, Company, Cores, Crew, Rockets are kept
- New cassettes needed for the 9 new endpoints
- SimpleCov minimum remains 93%

## Versioning

Bump `SPACEX::VERSION` from `1.1.0` to `2.0.0`. Document breaking changes in CHANGELOG.
