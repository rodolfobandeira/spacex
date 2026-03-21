# SpaceX Gem 2.0 — V4 Namespace Consolidation

**Date:** 2026-03-21
**Status:** Approved

## Summary

The gem currently has two parallel API implementations: a legacy V3 layer (modules with dynamic Hashie::Mash responses) and an incomplete V4 layer (`SPACEX::V4::*` classes with explicit property declarations). V3 is fully deprecated by the SpaceX API. This spec describes consolidating to a single, clean V4-only interface at gem version 2.0.0.

## Goals

- Single unified namespace: `SPACEX::<Resource>` — no version prefix exposed to users
- All 14 active V4 endpoints implemented
- Explicit property declarations via `Hashie::Trash` for typed responses where appropriate
- Clean 2.0.0 breaking release — no backwards compatibility shims

## Breaking Changes

- `SPACEX::V4::*` namespace removed; use `SPACEX::*` instead
- V3-only endpoints removed entirely: `SPACEX::ApiInfo`, `SPACEX::Missions`, `SPACEX::DragonCapsules` (replaced by `SPACEX::Dragons`)
- `SPACEX::Launches` now points to `/v4/launches` (different schema from V3)
- `SPACEX::Launches.all` removed (was a V3 alias for `.info`; not carried forward)
- `SPACEX::LandingPads` renamed to `SPACEX::Landpads` (matches V4 API path `/v4/landpads`)
- `SPACEX::LaunchPads` renamed to `SPACEX::Launchpads` (matches V4 API path `/v4/launchpads`)
- `SPACEX::CompanyInfo` renamed to `SPACEX::Company` (matches V4 API path `/v4/company`)
- `BaseRequest.info` no longer accepts a `version` parameter — always calls `/v4/`
- `.info(id, _query = {})` second parameter removed from all endpoints — signature is now `.info(id = nil)` only

## Architecture

### HTTP Layer

`BaseRequest.info(path, klass = nil)` — version parameter dropped, always calls `/v4/`. No other changes to the request pipeline.

`SPACEX::BASE_URI` is currently defined in `lib/spacex/endpoint.rb`. Since that file is being deleted, the constant must be moved to `lib/spacex/base_request.rb` (at the top of the `SPACEX` module block, before `BaseRequest` is defined). `endpoint_spec.rb` tests this constant — delete it without replacement; coverage of a simple URI string constant is not required.

### Path Construction

The 12 typed endpoints use `"resource/#{id}"` to build the path. When `id` is `nil` this produces a trailing slash (e.g. `"launches/"`), which the SpaceX V4 API accepts.

The 2 single-object endpoints (`Company`, `Roadster`) call fixed paths `'company'` and `'roadster'` with no id interpolation.

`SPACEX::Launches` special methods pass fixed path strings directly to `BaseRequest.info`:
- `.latest` → path `'launches/latest'`
- `.next` → path `'launches/next'`
- `.past` → path `'launches/past'`
- `.upcoming` → path `'launches/upcoming'`

### Resource Classes

Two response patterns are used:

1. **Typed resources** (12 endpoints) — Inherit from `SPACEX::Resource` (`Hashie::Trash` + `IgnoreUndeclared`) with explicit `property` declarations. The class itself is passed as `klass` to `BaseRequest.info`. Top-level properties are declared flat (one level); nested objects pass through as `Hashie::Mash`. No recursive typing required.

2. **Single-object endpoints** (`Company`, `Roadster`) — Plain modules. `.info` passes `nil` as `klass`, returning a `SPACEX::Response` (Hashie::Mash). No inheritance needed.

`SPACEX::Resource` in `resource.rb` is unchanged.

### Launches — klass argument per method

| Method | klass |
|---|---|
| `.info` (collection) | `SPACEX::Launches` |
| `.info(id)` (single) | `SPACEX::Launches` |
| `.latest` | `SPACEX::Launches` |
| `.next` | `SPACEX::Launches` |
| `.past` | `SPACEX::Launches` |
| `.upcoming` | `SPACEX::Launches` |

All Launches methods pass `SPACEX::Launches` as klass. `BaseRequest#process` wraps arrays element-by-element and single objects directly, so the return type is automatically correct.

### Property Declarations

**For endpoints already declared in `v4/` (Capsules, Cores):** properties are already defined — change inheritance to `< SPACEX::Resource`, keep existing `property` declarations unchanged.

**For Crew** (currently no properties declared in `v4/crew.rb`): use these 7 properties derived from the existing spec and cassette. Do not re-record:
`agency`, `id`, `image`, `launches`, `name`, `status`, `wikipedia`

**For Rockets** (currently no properties declared in `v4/rockets.rb`): do not re-record. Read `spec/fixtures/spacex/v4/rockets.yml` and declare a `property` for every top-level key present in the response object.

**For all new and rewritten typed endpoints** (Dragons, History, Landpads, Launches, Launchpads, Payloads, Ships, Starlink): cassette recording is a prerequisite before writing the property declarations. Workflow: record cassette → read response object in cassette → declare a `property` for every top-level key.

For Rockets and Crew: update `klass` from `nil` to the resource class (e.g. `SPACEX::Rockets`, `SPACEX::Crew`).

For Capsules and Cores: change inheritance from `Hashie::Trash` (with inline `include`) to `< SPACEX::Resource`.

## Endpoint Inventory

| Class | File | Path | Pattern | Special methods |
|---|---|---|---|---|
| `SPACEX::Capsules` | `capsules.rb` | `/v4/capsules` | Typed (Resource) | `.info`, `.info(id)` |
| `SPACEX::Company` | `company.rb` | `/v4/company` | Single-object (Response) | `.info` |
| `SPACEX::Cores` | `cores.rb` | `/v4/cores` | Typed (Resource) | `.info`, `.info(id)` |
| `SPACEX::Crew` | `crew.rb` | `/v4/crew` | Typed (Resource) | `.info`, `.info(id)` |
| `SPACEX::Dragons` | `dragons.rb` | `/v4/dragons` | Typed (Resource) | `.info`, `.info(id)` |
| `SPACEX::History` | `history.rb` | `/v4/history` | Typed (Resource) | `.info`, `.info(id)` |
| `SPACEX::Landpads` | `landpads.rb` | `/v4/landpads` | Typed (Resource) | `.info`, `.info(id)` |
| `SPACEX::Launches` | `launches.rb` | `/v4/launches` | Typed (Resource) | `.info`, `.info(id)`, `.latest`, `.next`, `.past`, `.upcoming` |
| `SPACEX::Launchpads` | `launchpads.rb` | `/v4/launchpads` | Typed (Resource) | `.info`, `.info(id)` |
| `SPACEX::Payloads` | `payloads.rb` | `/v4/payloads` | Typed (Resource) | `.info`, `.info(id)` |
| `SPACEX::Roadster` | `roadster.rb` | `/v4/roadster` | Single-object (Response) | `.info` |
| `SPACEX::Rockets` | `rockets.rb` | `/v4/rockets` | Typed (Resource) | `.info`, `.info(id)` |
| `SPACEX::Ships` | `ships.rb` | `/v4/ships` | Typed (Resource) | `.info`, `.info(id)` |
| `SPACEX::Starlink` | `starlink.rb` | `/v4/starlink` | Typed (Resource) | `.info`, `.info(id)` |

## File Changes

### `lib/spacex.rb`

Current file starts with `require 'faraday'` and `require 'hashie'` — keep those at the top (third-party gems must load before `spacex/resource` which inherits from `Hashie::Trash`). Final state:

```ruby
require 'faraday'
require 'hashie'

require_relative 'spacex/resource'      # must come before models
require_relative 'spacex/base_request'
require_relative 'spacex/version'
require_relative 'spacex/models'
```

All V3 `require_relative` lines are removed. `history.rb` and `ships.rb` are rewritten in-place and loaded via `autoload` in `models.rb`, not required directly.

### `lib/spacex/base_request.rb`

Move `SPACEX::BASE_URI = 'https://api.spacexdata.com'` here from `endpoint.rb` (top of the `SPACEX` module block, before `BaseRequest`). Remove `version = 'v3'` parameter from `info` and `get`. Hardcode `'v4'` in `conn`.

### `lib/spacex/models.rb`

Replace the `SPACEX::V4` module block with:

```ruby
module SPACEX
  autoload :Capsules,    'spacex/capsules'
  autoload :Company,     'spacex/company'
  autoload :Cores,       'spacex/cores'
  autoload :Crew,        'spacex/crew'
  autoload :Dragons,     'spacex/dragons'
  autoload :History,     'spacex/history'
  autoload :Landpads,    'spacex/landpads'
  autoload :Launches,    'spacex/launches'
  autoload :Launchpads,  'spacex/launchpads'
  autoload :Payloads,    'spacex/payloads'
  autoload :Roadster,    'spacex/roadster'
  autoload :Rockets,     'spacex/rockets'
  autoload :Ships,       'spacex/ships'
  autoload :Starlink,    'spacex/starlink'
end
```

### `lib/spacex/version.rb`

Bump to `'2.0.0'`. `version_spec.rb` only asserts `SPACEX::VERSION` is not nil — confirmed by reading the file; it will pass without changes.

### Files to delete (lib)

- `lib/spacex/v4/` (entire directory)
- `lib/spacex/api_info.rb`
- `lib/spacex/dragon_capsules.rb`
- `lib/spacex/missions.rb`
- `lib/spacex/company_info.rb`
- `lib/spacex/endpoint.rb` (after moving `BASE_URI` to `base_request.rb`)
- `lib/spacex/landing_pads.rb` (replaced by `landpads.rb`)
- `lib/spacex/launch_pads.rb` (replaced by `launchpads.rb`)

### Files to rewrite in-place (replace entire file contents)

- `lib/spacex/capsules.rb` — `< SPACEX::Resource`; keep existing V4 properties
- `lib/spacex/cores.rb` — `< SPACEX::Resource`; keep existing V4 properties
- `lib/spacex/history.rb` — `SPACEX::Resource` with V4 properties (record cassette first)
- `lib/spacex/launches.rb` — V4 schema + special methods (record cassettes first)
- `lib/spacex/payloads.rb` — `SPACEX::Resource` with V4 properties (record cassette first)
- `lib/spacex/roadster.rb` — plain module, single-object
- `lib/spacex/rockets.rb` — `SPACEX::Resource`; add property declarations from existing cassette; update klass to `SPACEX::Rockets`
- `lib/spacex/ships.rb` — `SPACEX::Resource` with V4 properties; replace V3 properties entirely (record cassette first)

### New files (lib)

- `lib/spacex/company.rb` — plain module (based on `v4/company.rb`)
- `lib/spacex/crew.rb` — `SPACEX::Resource` with 7 properties listed above; update klass to `SPACEX::Crew`
- `lib/spacex/dragons.rb` — `SPACEX::Resource` (record cassette first)
- `lib/spacex/landpads.rb` — `SPACEX::Resource` (record cassette first)
- `lib/spacex/launchpads.rb` — `SPACEX::Resource` (record cassette first)
- `lib/spacex/starlink.rb` — `SPACEX::Resource` (record cassette first)

## Testing

### Two directories

`spec/spacex/v4/` holds spec Ruby files. `spec/fixtures/spacex/v4/` holds VCR cassette YAML files. These are distinct — only spec files are deleted in this section; cassette files are addressed separately.

### Spec files to delete

- `spec/spacex/v4/` (entire directory)
- `spec/spacex/api_info_spec.rb`
- `spec/spacex/dragon_capsules_spec.rb`
- `spec/spacex/missions_spec.rb`
- `spec/spacex/company_info_spec.rb`
- `spec/spacex/endpoint_spec.rb` (deleted without replacement)
- `spec/spacex/landing_pads_spec.rb`
- `spec/spacex/launch_pads_spec.rb`

### Spec files to rewrite or create

All files below that exist on disk must have their **entire file contents replaced** — do not preserve any V3 test content.

```
spec/spacex/
  capsules_spec.rb      (rewrite — V3 exists)
  company_spec.rb       (new)
  cores_spec.rb         (rewrite — V3 exists)
  crew_spec.rb          (rewrite — was in spec/spacex/v4/)
  dragons_spec.rb       (new)
  history_spec.rb       (rewrite — V3 exists)
  landpads_spec.rb      (new)
  launches_spec.rb      (rewrite — V3 exists)
  launchpads_spec.rb    (new)
  payloads_spec.rb      (rewrite — V3 exists)
  roadster_spec.rb      (rewrite — V3 exists)
  rockets_spec.rb       (rewrite — V3 exists; V4 was in spec/spacex/v4/)
  ships_spec.rb         (rewrite — V3 exists)
  starlink_spec.rb      (new)
```

For Capsules, Cores, Rockets, and Crew: replace any `expect(subject.first).to be_a Hash` assertions with `expect(subject.first).to be_a SPACEX::<ClassName>`.

### VCR cassettes

All V3 cassettes under `spec/fixtures/spacex/` **not** inside the `v4/` subdirectory are deleted.

All cassettes live under `spec/fixtures/spacex/v4/`. Uniform naming convention:
- Collection: `v4/<resource>/all.yml`
- Single record: `v4/<resource>/one.yml`
- Sub-routes: `v4/<resource>/<method>.yml`
- Single-object endpoints: `v4/<resource>.yml` (no subdirectory)

Rename existing V4 cassettes:

| Old path | New path |
|---|---|
| `v4/capsules.yml` | `v4/capsules/all.yml` |
| `v4/capsules/<id>.yml` | `v4/capsules/one.yml` |
| `v4/cores.yml` | `v4/cores/all.yml` |
| `v4/cores/<id>.yml` | `v4/cores/one.yml` |
| `v4/crew.yml` | `v4/crew/all.yml` |
| `v4/crew/<id>.yml` | `v4/crew/one.yml` |
| `v4/rockets.yml` | `v4/rockets/all.yml` |
| `v4/rockets/<id>.yml` | `v4/rockets/one.yml` |
| `v4/company.yml` | stays as `v4/company.yml` |

After renaming, update the `cassette_name:` references in each spec file.

New cassettes to record:

- Launches: `v4/launches/all.yml`, `v4/launches/one.yml`, `v4/launches/latest.yml`, `v4/launches/next.yml`, `v4/launches/past.yml`, `v4/launches/upcoming.yml`
- Dragons: `v4/dragons/all.yml`, `v4/dragons/one.yml`
- History: `v4/history/all.yml`, `v4/history/one.yml`
- Landpads: `v4/landpads/all.yml`, `v4/landpads/one.yml`
- Launchpads: `v4/launchpads/all.yml`, `v4/launchpads/one.yml`
- Payloads: `v4/payloads/all.yml`, `v4/payloads/one.yml`
- Ships: `v4/ships/all.yml`, `v4/ships/one.yml`
- Starlink: `v4/starlink/all.yml`, `v4/starlink/one.yml`
- Roadster: `v4/roadster.yml`

### Coverage

SimpleCov minimum remains 93%.

## Versioning

Bump `SPACEX::VERSION` to `'2.0.0'`. Create `CHANGELOG.md` in the project root (Keep a Changelog format) with a `[2.0.0]` entry listing all breaking changes from this spec. This is a manual documentation step — do it alongside the code changes.
