require 'spec_helper'

describe SPACEX::V4::Rockets do
  context '#info', vcr: { cassette_name: 'v4/rockets' } do
    subject do
      SPACEX::V4::Rockets.info
    end
    it 'returns an array of rocket hashes,
      each with the specified list of keys' do
      expect(subject).to be_an Array
      expect(subject.first).to be_a Hash
      subject.all? do |rocket|
        expect(rocket.keys).to contain_exactly(
          'active',
          'boosters',
          'company',
          'cost_per_launch',
          'country',
          'description',
          'diameter',
          'engines',
          'first_flight',
          'first_stage',
          'flickr_images',
          'height',
          'id',
          'landing_legs',
          'mass',
          'name',
          'payload_weights',
          'second_stage',
          'stages',
          'success_rate_pct',
          'type',
          'wikipedia'
        )
      end
    end
  end

  context "#info('5e9d0d95eda69955f709d1eb')",
          vcr: { cassette_name: 'v4/rockets/5e9d0d95eda69955f709d1eb' } do
    subject do
      SPACEX::V4::Rockets.info('5e9d0d95eda69955f709d1eb')
    end
    it 'return specific rocket details' do
      expect(subject.active).to eq false
      expect(subject.boosters).to eq 0
      expect(subject.company).to eq 'SpaceX'
      expect(subject.cost_per_launch).to eq 6_700_000
      expect(subject.country).to eq 'Republic of the Marshall Islands'
      expect(subject.description).to eq(
        'The Falcon 1 was an expendable launch system privately developed '\
        'and manufactured by SpaceX during 2006-2009. On 28 September 2008, '\
        'Falcon 1 became the first privately-developed liquid-fuel launch '\
        'vehicle to go into orbit around the Earth.'
      )
      expect(subject.diameter).to eq(
        {
          'meters' => 1.68,
          'feet' => 5.5
        }
      )
      expect(subject.engines).to eq(
        {
          'isp' => {
            'sea_level' => 267,
            'vacuum' => 304
          },
          'thrust_sea_level' => {
            'kN' => 420,
            'lbf' => 94_000
          },
          'thrust_vacuum' => {
            'kN' => 480,
            'lbf' => 110_000
          },
          'number' => 1,
          'type' => 'merlin',
          'version' => '1C',
          'layout' => 'single',
          'engine_loss_max' => 0,
          'propellant_1' => 'liquid oxygen',
          'propellant_2' => 'RP-1 kerosene',
          'thrust_to_weight' => 96
        }
      )
      expect(subject.first_flight).to eq '2006-03-24'
      expect(subject.first_stage).to eq(
        {
          'thrust_sea_level' => {
            'kN' => 420,
            'lbf' => 94_000
          },
          'thrust_vacuum' => {
            'kN' => 480,
            'lbf' => 110_000
          },
          'reusable' => false,
          'engines' => 1,
          'fuel_amount_tons' => 44.3,
          'burn_time_sec' => 169
        }
      )
      expect(subject.flickr_images).to eq(
        [
          'https://imgur.com/DaCfMsj.jpg',
          'https://imgur.com/azYafd8.jpg'
        ]
      )
      expect(subject.height).to eq(
        {
          'meters' => 22.25,
          'feet' => 73
        }
      )
      expect(subject.id).to eq '5e9d0d95eda69955f709d1eb'
      expect(subject.landing_legs).to eq(
        {
          'number' => 0,
          'material' => nil
        }
      )
      expect(subject.mass).to eq(
        {
          'kg' => 30_146,
          'lb' => 66_460
        }
      )
      expect(subject.name).to eq 'Falcon 1'
      expect(subject.payload_weights).to eq(
        [
          {
            'id' => 'leo',
            'name' => 'Low Earth Orbit',
            'kg' => 450,
            'lb' => 992
          }
        ]
      )
      expect(subject.second_stage).to eq(
        {
          'thrust' => {
            'kN' => 31,
            'lbf' => 7000
          },
          'payloads' => {
            'composite_fairing' => {
              'height' => {
                'meters' => 3.5,
                'feet' => 11.5
              },
              'diameter' => {
                'meters' => 1.5,
                'feet' => 4.9
              }
            },
            'option_1' => 'composite fairing'
          },
          'reusable' => false,
          'engines' => 1,
          'fuel_amount_tons' => 3.38,
          'burn_time_sec' => 378
        }
      )
      expect(subject.stages).to eq 2
      expect(subject.success_rate_pct).to eq 40
      expect(subject.type).to eq 'rocket'
      expect(subject.wikipedia).to eq 'https://en.wikipedia.org/wiki/Falcon_1'
    end
  end
end
