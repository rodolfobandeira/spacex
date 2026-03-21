# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
bundle install                    # Install dependencies
bundle exec rspec                 # Run all tests
bundle exec rspec spec/path/to_spec.rb        # Run a single spec file
bundle exec rspec spec/path/to_spec.rb:42     # Run test at a specific line
bundle exec rubocop               # Check style
bundle exec rubocop -a            # Auto-fix style issues
bundle exec rake                  # Run rubocop + rspec (default task)
```

Coverage must remain at or above 93% (enforced by SimpleCov).

## Architecture

This is a Ruby HTTP client library wrapping the SpaceX REST API. It has two API versions with distinct patterns.

### HTTP Layer

`lib/spacex/base_request.rb` handles all requests using Faraday. The `info(path, klass = nil, version = 'v3')` class method builds the URL, makes the request, and wraps responses. Arrays of results are returned as-is; single-object responses are wrapped in `klass` (or `SPACEX::Response` if nil). `SPACEX::Response` extends `Hashie::Mash`, enabling attribute-style access on JSON.

### V3 Endpoints (legacy)

Modules under `lib/spacex/` with class methods. No property definitions — responses use dynamic `SPACEX::Response` (Hashie::Mash). Example:

```ruby
SPACEX::Launches.latest       # GET /launches/latest
SPACEX::Launches.info(id)     # GET /launches/:id
SPACEX::Launches.info         # GET /launches
```

### V4 Endpoints

Classes under `lib/spacex/v4/` extending `SPACEX::Resource` (which extends `Hashie::Trash`). Properties are declared explicitly. Include `Hashie::Extensions::IgnoreUndeclared` to tolerate unknown fields. Example:

```ruby
SPACEX::V4::Crew.info         # GET /v4/crew
SPACEX::V4::Crew.info(id)     # GET /v4/crew/:id
```

### Adding a New V4 Endpoint

1. Create `lib/spacex/v4/thing.rb` extending `SPACEX::Resource`, declare properties, add `info` class method calling `BaseRequest.info`
2. Require it in `lib/spacex/models.rb`
3. Add VCR cassette fixture in `spec/fixtures/spacex/v4/`
4. Write spec in `spec/spacex/v4/thing_spec.rb` using `vcr: { cassette_name: 'v4/thing' }`

### Testing

Tests use RSpec + VCR for cassette-based HTTP mocking. Cassettes live in `spec/fixtures/spacex/`. VCR configuration is in `spec/support/vcr.rb`. Tag a context with `vcr: { cassette_name: 'path/cassette' }` to replay recorded HTTP.
