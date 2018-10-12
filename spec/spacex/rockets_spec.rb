require 'spec_helper'

describe SPACEX do
  context 'Rockets', vcr: { cassette_name: 'rockets/info' } do
    subject do
      SPACEX::Rockets.info
    end

    it "returns all Rockets' when no id is passed info" do
      first_subject = subject.first
      expect(first_subject.id).to eq 1
      expect(first_subject.active).to eq false
      expect(first_subject.stages).to eq 2
      expect(first_subject.boosters).to eq 0
      expect(first_subject.cost_per_launch).to eq 6_700_000
      expect(first_subject.success_rate_pct).to eq 40
      expect(first_subject.first_flight).to eq '2006-03-24'
      expect(first_subject.country).to eq 'Republic of the Marshall Islands'
      expect(first_subject.company).to eq 'SpaceX'
      expect(first_subject.height).to eq(
        'meters' => 22.25,
        'feet' => 73
      )
      expect(first_subject.diameter).to eq(
        'meters' => 1.68,
        'feet' => 5.5
      )
      expect(first_subject.mass).to eq(
        'kg' => 30_146,
        'lb' => 66_460
      )
      expect(first_subject.payload_weights).to eq [{
        'id' => 'leo',
        'name' => 'Low Earth Orbit',
        'kg' => 450,
        'lb' => 992
      }]
      expect(first_subject.first_stage).to eq(
        'reusable' => false,
        'engines' => 1,
        'fuel_amount_tons' => 44.3,
        'burn_time_sec' => 169,
        'thrust_sea_level' => {
          'kN' => 420,
          'lbf' => 94_000
        },
        'thrust_vacuum' => {
          'kN' => 480,
          'lbf' => 110_000
        }
      )
      expect(first_subject.second_stage).to eq(
        'engines' => 1,
        'fuel_amount_tons' => 3.38,
        'burn_time_sec' => 378,
        'thrust' => {
          'kN' => 31,
          'lbf' => 7000
        },
        'payloads' => {
          'option_1' => 'composite fairing',
          'composite_fairing' => {
            'height' => {
              'meters' => 3.5,
              'feet' => 11.5
            },
            'diameter' => {
              'meters' => 1.5,
              'feet' => 4.9
            }
          }
        }
      )
      expect(first_subject.engines).to eq(
        'number' => 1,
        'type' => 'merlin',
        'version' => '1C',
        'layout' => 'single',
        'engine_loss_max' => 0,
        'propellant_1' => 'liquid oxygen',
        'propellant_2' => 'RP-1 kerosene',
        'thrust_sea_level' => {
          'kN' => 420,
          'lbf' => 94_000
        },
        'thrust_vacuum' => {
          'kN' => 480,
          'lbf' => 110_000
        },
        'thrust_to_weight' => 96
      )
      expect(first_subject.landing_legs).to eq(
        'number' => 0,
        'material' => nil
      )
      expect(first_subject.wikipedia).to eq(
        'https://en.wikipedia.org/wiki/Falcon_1'
      )
      expect(first_subject.description).to eq(
        'The Falcon 1 was an expendable launch system '\
        'privately developed and manufactured by SpaceX during 2006-2009. '\
        'On 28 September 2008, Falcon 1 became the first '\
        'privately-developed liquid-fuel launch vehicle to '\
        'go into orbit around the Earth.'
      )
      expect(first_subject.rocket_id).to eq 'falcon1'
      expect(first_subject.rocket_name).to eq 'Falcon 1'
      expect(first_subject.rocket_type).to eq 'rocket'
    end
  end

  context 'Get specific Rocket', vcr: { cassette_name: 'rockets/info/falcon1' } do
    subject do
      SPACEX::Rockets.info('falcon1')
    end

    it 'returns Rocket info for "falcon1"' do
      expect(subject.id).to eq 1
      expect(subject.active).to eq false
      expect(subject.stages).to eq 2
      expect(subject.boosters).to eq 0
      expect(subject.cost_per_launch).to eq 6_700_000
      expect(subject.success_rate_pct).to eq 40
      expect(subject.first_flight).to eq '2006-03-24'
      expect(subject.country).to eq 'Republic of the Marshall Islands'
      expect(subject.company).to eq 'SpaceX'
      expect(subject.height).to eq(
        'meters' => 22.25,
        'feet' => 73
      )
      expect(subject.diameter).to eq(
        'meters' => 1.68,
        'feet' => 5.5
      )
      expect(subject.mass).to eq(
        'kg' => 30_146,
        'lb' => 66_460
      )
      expect(subject.payload_weights).to eq [{
        'id' => 'leo',
        'name' => 'Low Earth Orbit',
        'kg' => 450,
        'lb' => 992
      }]
      expect(subject.first_stage).to eq(
        'reusable' => false,
        'engines' => 1,
        'fuel_amount_tons' => 44.3,
        'burn_time_sec' => 169,
        'thrust_sea_level' => {
          'kN' => 420,
          'lbf' => 94_000
        },
        'thrust_vacuum' => {
          'kN' => 480,
          'lbf' => 110_000
        }
      )
      expect(subject.second_stage).to eq(
        'engines' => 1,
        'fuel_amount_tons' => 3.38,
        'burn_time_sec' => 378,
        'thrust' => {
          'kN' => 31,
          'lbf' => 7000
        },
        'payloads' => {
          'option_1' => 'composite fairing',
          'composite_fairing' => {
            'height' => {
              'meters' => 3.5,
              'feet' => 11.5
            },
            'diameter' => {
              'meters' => 1.5,
              'feet' => 4.9
            }
          }
        }
      )
      expect(subject.engines).to eq(
        'number' => 1,
        'type' => 'merlin',
        'version' => '1C',
        'layout' => 'single',
        'engine_loss_max' => 0,
        'propellant_1' => 'liquid oxygen',
        'propellant_2' => 'RP-1 kerosene',
        'thrust_sea_level' => {
          'kN' => 420,
          'lbf' => 94_000
        },
        'thrust_vacuum' => {
          'kN' => 480,
          'lbf' => 110_000
        },
        'thrust_to_weight' => 96
      )
      expect(subject.landing_legs).to eq(
        'number' => 0,
        'material' => nil
      )
      expect(subject.wikipedia).to eq(
        'https://en.wikipedia.org/wiki/Falcon_1'
      )
      expect(subject.description).to eq(
        'The Falcon 1 was an expendable launch system '\
        'privately developed and manufactured by SpaceX during 2006-2009. '\
        'On 28 September 2008, Falcon 1 became the first '\
        'privately-developed liquid-fuel launch vehicle to '\
        'go into orbit around the Earth.'
      )
      expect(subject.rocket_id).to eq 'falcon1'
      expect(subject.rocket_name).to eq 'Falcon 1'
      expect(subject.rocket_type).to eq 'rocket'
    end
  end
end
