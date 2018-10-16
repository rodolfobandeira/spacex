### 0.0.8 (next)

* [#43](https://github.com/rodolfobandeira/spacex/pull/43): Abstracts `retrieve_all` method in capsules, cores, dragon_capsules, missions, rockets, and ships resources. Adds in ResourceService module to house the abstracted `retrieve_all` method and potential future abstractions.
* [#40](https://github.com/rodolfobandeira/spacex/pull/40): Update and clarify information in README -
  [@annawinkler](https://github.com/annawinkler).
* [#34](https://github.com/rodolfobandeira/spacex/pull/34): Implement Capsules endpoint - [@efl7a](https://github.com/efl7a).
* [#34](https://github.com/rodolfobandeira/spacex/pull/34): Implement Cores endpoint - [@efl7a](https://github.com/efl7a).
* [#35](https://github.com/rodolfobandeira/spacex/pull/35): Implement Rockets endpoint - [@invacuo](https://github.com/invacuo).
* [#28](https://github.com/rodolfobandeira/spacex/pull/28): Add ability to query all launches - [@ludamillion](https://github.com/ludamillion).
* [#26](https://github.com/rodolfobandeira/spacex/pull/26): Fix dependencies - [@harman28](https://github.com/harman28).
* [#25](https://github.com/rodolfobandeira/spacex/pull/25): Add code coverage tools - [@harman28](https://github.com/harman28).
* [#27](https://github.com/rodolfobandeira/spacex/pull/27): Add ability to query next launch - [@Andrey-Raspopov](https://github.com/Andrey-Raspopov)

### 0.0.7 (2018/10/07)

* Refactor responses getting multiple objects like Ships, Capsules to wrap a specific object. This helps translating specific properties like `id` and `class` to `ship_id`, `ship_class` - [@rodolfobandeira](https://github.com/rodolfobandeira).
* Add ability to retrieve specific Ship via `.info('ship_id')` - [@rodolfobandeira](https://github.com/rodolfobandeira).
* Add ability to retrieve specific Dragon Capsule via `.info('dragon_id')` - [@rodolfobandeira](https://github.com/rodolfobandeira).
* [#10](https://github.com/rodolfobandeira/spacex/pull/10): Added Ships information - [@zainalmustofa](https://github.com/zainalmustofa).
* [#9](https://github.com/rodolfobandeira/spacex/pull/9): Added Dragon Capsules information - [@JackieCalapristi](https://github.com/JackieCalapristi).
* [#16](https://github.com/rodolfobandeira/spacex/pull/16): Added missions information - [@maiafernando](https://github.com/maiafernando).

### 0.0.6 (2018/08/22)

* Added Roadster information - [@rodolfobandeira](https://github.com/rodolfobandeira).

### 0.0.5 (2018/08/21)

* Added Company information and General Refactors - [@rodolfobandeira](https://github.com/rodolfobandeira).

### 0.0.4 (2018/08/21)

* Initial public release - [@rodolfobandeira](https://github.com/rodolfobandeira).
