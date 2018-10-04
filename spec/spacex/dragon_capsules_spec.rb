# frozen_string_literal: true

# rubocop:disable Metrics/LineLength
# rubocop:disable Metrics/BlockLength

require 'spec_helper'

describe SPACEX do
  context 'DragonCapsules', vcr: { cassette_name: 'dragon_capsules/info' } do
    subject do
      SPACEX::DragonCapsules.info
    end
    it 'returns Dragon Capsules info' do
      expect(subject[0]['id']).to eq 'dragon1'
      expect(subject[0]['name']).to eq 'Dragon 1'
      expect(subject[0]['type']).to eq 'capsule'
      expect(subject[0]['active']).to eq true
      expect(subject[0]['crew_capacity']).to eq 0
      expect(subject[0]['sidewall_angle_deg']).to eq 15
      expect(subject[0]['orbit_duration_yr']).to eq 2
      expect(subject[0]['dry_mass_kg']).to eq 4_200
      expect(subject[0]['dry_mass_lb']).to eq 9_300
      expect(subject[0]['first_flight']).to eq '2010-12-08'
      expect(subject[0]['heat_shield']['material']).to eq 'PICA-X'
      expect(subject[0]['heat_shield']['size_meters']).to eq 3.6
      expect(subject[0]['heat_shield']['temp_degrees']).to eq 3_000
      expect(subject[0]['heat_shield']['dev_partner']).to eq 'NASA'
      expect(subject[0]['thrusters'][0]['type']).to eq 'Draco'
      expect(subject[0]['thrusters'][0]['amount']).to eq 18
      expect(subject[0]['thrusters'][0]['pods']).to eq 4
      expect(subject[0]['thrusters'][0]['fuel_1']).to eq 'nitrogen tetroxide'
      expect(subject[0]['thrusters'][0]['fuel_2']).to eq 'monomethylhydrazine'
      expect(subject[0]['thrusters'][0]['thrust']['kN']).to eq 0.4
      expect(subject[0]['thrusters'][0]['thrust']['lbf']).to eq 90
      expect(subject[0]['launch_payload_mass']['kg']).to eq 6_000
      expect(subject[0]['launch_payload_mass']['lb']).to eq 13_228
      expect(subject[0]['launch_payload_vol']['cubic_meters']).to eq 25
      expect(subject[0]['launch_payload_vol']['cubic_feet']).to eq 883
      expect(subject[0]['return_payload_mass']['kg']).to eq 3_000
      expect(subject[0]['return_payload_mass']['lb']).to eq 6_614
      expect(subject[0]['return_payload_vol']['cubic_meters']).to eq 11
      expect(subject[0]['return_payload_vol']['cubic_feet']).to eq 388
      expect(subject[0]['pressurized_capsule']['payload_volume']['cubic_meters']).to eq 11
      expect(subject[0]['pressurized_capsule']['payload_volume']['cubic_feet']).to eq 388
      expect(subject[0]['trunk']['trunk_volume']['cubic_meters']).to eq 14
      expect(subject[0]['trunk']['trunk_volume']['cubic_feet']).to eq 494
      expect(subject[0]['trunk']['cargo']['solar_array']).to eq 2
      expect(subject[0]['trunk']['cargo']['unpressurized_cargo']).to eq true
      expect(subject[0]['height_w_trunk']['meters']).to eq 7.2
      expect(subject[0]['height_w_trunk']['feet']).to eq 23.6
      expect(subject[0]['diameter']['meters']).to eq 3.7
      expect(subject[0]['diameter']['feet']).to eq 12
      expect(subject[0]['wikipedia']).to eq 'https://en.wikipedia.org/wiki/SpaceX_Dragon'
      expect(subject[0]['description']).to eq 'Dragon is a reusable spacecraft developed by SpaceX, an American private space transportation company based in Hawthorne, California. Dragon is launched into space by the SpaceX Falcon 9 two-stage-to-orbit launch vehicle. The Dragon spacecraft was originally designed for human travel, but so far has only been used to deliver cargo to the International Space Station (ISS).'

      expect(subject[1]['id']).to eq 'dragon2'
      expect(subject[1]['name']).to eq 'Dragon 2'
      expect(subject[1]['type']).to eq 'capsule'
      expect(subject[1]['active']).to eq false
      expect(subject[1]['crew_capacity']).to eq 7
      expect(subject[1]['sidewall_angle_deg']).to eq 15
      expect(subject[1]['orbit_duration_yr']).to eq 2
      expect(subject[1]['dry_mass_kg']).to eq 6_350
      expect(subject[1]['dry_mass_lb']).to eq 14_000
      expect(subject[1]['first_flight']).to eq '2018-11-01'
      expect(subject[1]['heat_shield']['material']).to eq 'PICA-X'
      expect(subject[1]['heat_shield']['size_meters']).to eq 3.6
      expect(subject[1]['heat_shield']['temp_degrees']).to eq 3_000
      expect(subject[1]['heat_shield']['dev_partner']).to eq 'NASA'
      expect(subject[1]['thrusters'][0]['type']).to eq 'Draco'
      expect(subject[1]['thrusters'][0]['amount']).to eq 18
      expect(subject[1]['thrusters'][0]['pods']).to eq 4
      expect(subject[1]['thrusters'][0]['fuel_1']).to eq 'nitrogen tetroxide'
      expect(subject[1]['thrusters'][0]['fuel_2']).to eq 'monomethylhydrazine'
      expect(subject[1]['thrusters'][0]['thrust']['kN']).to eq 0.4
      expect(subject[1]['thrusters'][0]['thrust']['lbf']).to eq 90
      expect(subject[1]['thrusters'][1]['type']).to eq 'SuperDraco'
      expect(subject[1]['thrusters'][1]['amount']).to eq 8
      expect(subject[1]['thrusters'][1]['pods']).to eq 4
      expect(subject[1]['thrusters'][1]['fuel_1']).to eq 'dinitrogen tetroxide'
      expect(subject[1]['thrusters'][1]['fuel_2']).to eq 'monomethylhydrazine'
      expect(subject[1]['thrusters'][1]['thrust']['kN']).to eq 71
      expect(subject[1]['thrusters'][1]['thrust']['lbf']).to eq 16_000
      expect(subject[1]['launch_payload_mass']['kg']).to eq 6_000
      expect(subject[1]['launch_payload_mass']['lb']).to eq 13_228
      expect(subject[1]['launch_payload_vol']['cubic_meters']).to eq 25
      expect(subject[1]['launch_payload_vol']['cubic_feet']).to eq 883
      expect(subject[1]['return_payload_mass']['kg']).to eq 3_000
      expect(subject[1]['return_payload_mass']['lb']).to eq 6_614
      expect(subject[1]['return_payload_vol']['cubic_meters']).to eq 11
      expect(subject[1]['return_payload_vol']['cubic_feet']).to eq 388
      expect(subject[1]['pressurized_capsule']['payload_volume']['cubic_meters']).to eq 11
      expect(subject[1]['pressurized_capsule']['payload_volume']['cubic_feet']).to eq 388
      expect(subject[1]['trunk']['trunk_volume']['cubic_meters']).to eq 14
      expect(subject[1]['trunk']['trunk_volume']['cubic_feet']).to eq 494
      expect(subject[1]['trunk']['cargo']['solar_array']).to eq 2
      expect(subject[1]['trunk']['cargo']['unpressurized_cargo']).to eq true
      expect(subject[1]['height_w_trunk']['meters']).to eq 7.2
      expect(subject[1]['height_w_trunk']['feet']).to eq 23.6
      expect(subject[1]['diameter']['meters']).to eq 3.7
      expect(subject[1]['diameter']['feet']).to eq 12
      expect(subject[1]['wikipedia']).to eq 'https://en.wikipedia.org/wiki/Dragon_2'
      expect(subject[1]['description']).to eq 'Dragon 2 (also Crew Dragon, Dragon V2, or formerly DragonRider) is the second version of the SpaceX Dragon spacecraft, which will be a human-rated vehicle. It includes a set of four side-mounted thruster pods with two SuperDraco engines each, which can serve as a launch escape system or launch abort system (LAS). In addition, it has much larger windows, new flight computers and avionics, and redesigned solar arrays, and a modified outer mold line from the initial cargo Dragon that has been flying for several years.'
    end
  end

  context 'Get specific Dragon Capsule', vcr: { cassette_name: 'dragon_capsules/info/dragon1' } do
    subject do
      SPACEX::DragonCapsules.info('dragon1')
    end
    it 'returns Dragon Capsule info for "dragon1"' do
      expect(subject['id']).to eq 'dragon1'
      expect(subject['name']).to eq 'Dragon 1'
      expect(subject['type']).to eq 'capsule'
      expect(subject['active']).to eq true
      expect(subject['crew_capacity']).to eq 0
    end
  end
end
