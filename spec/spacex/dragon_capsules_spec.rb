require 'spec_helper'

describe SPACEX::DragonCapsules do
  context '#info', vcr: { cassette_name: 'dragon_capsules/info' } do
    subject do
      SPACEX::DragonCapsules.info
    end
    it 'returns Dragon Capsules info' do
      expect(subject.first.capsule_id).to eq 'dragon1'
      expect(subject.first.name).to eq 'Dragon 1'
      expect(subject.first.type).to eq 'capsule'
      expect(subject.first.active).to eq true
      expect(subject.first.crew_capacity).to eq 0
      expect(subject.first.sidewall_angle_deg).to eq 15
      expect(subject.first.orbit_duration_yr).to eq 2
      expect(subject.first.dry_mass_kg).to eq 4_200
      expect(subject.first.dry_mass_lb).to eq 9_300
      expect(subject.first.first_flight).to eq '2010-12-08'
      expect(subject.first.heat_shield).to eq ({ 'material' => 'PICA-X', 'size_meters' => 3.6, 'temp_degrees' => 3000, 'dev_partner' => 'NASA' })
      expect(subject.first.heat_shield['material']).to eq 'PICA-X'
      expect(subject.first.heat_shield['size_meters']).to eq 3.6
      expect(subject.first.heat_shield['temp_degrees']).to eq 3_000
      expect(subject.first.heat_shield['dev_partner']).to eq 'NASA'
      expect(subject.first.thrusters[0]['type']).to eq 'Draco'
      expect(subject.first.thrusters[0]['amount']).to eq 18
      expect(subject.first.thrusters[0]['pods']).to eq 4
      expect(subject.first.thrusters[0]['fuel_1']).to eq 'nitrogen tetroxide'
      expect(subject.first.thrusters[0]['fuel_2']).to eq 'monomethylhydrazine'
      expect(subject.first.thrusters[0]['thrust']['kN']).to eq 0.4
      expect(subject.first.thrusters[0]['thrust']['lbf']).to eq 90
      expect(subject.first.launch_payload_mass['kg']).to eq 6_000
      expect(subject.first.launch_payload_mass['lb']).to eq 13_228
      expect(subject.first.launch_payload_vol['cubic_meters']).to eq 25
      expect(subject.first.launch_payload_vol['cubic_feet']).to eq 883
      expect(subject.first.return_payload_mass['kg']).to eq 3_000
      expect(subject.first.return_payload_mass['lb']).to eq 6_614
      expect(subject.first.return_payload_vol['cubic_meters']).to eq 11
      expect(subject.first.return_payload_vol['cubic_feet']).to eq 388
      expect(subject.first.pressurized_capsule['payload_volume']['cubic_meters']).to eq 11
      expect(subject.first.pressurized_capsule['payload_volume']['cubic_feet']).to eq 388
      expect(subject.first.trunk['trunk_volume']['cubic_meters']).to eq 14
      expect(subject.first.trunk['trunk_volume']['cubic_feet']).to eq 494
      expect(subject.first.trunk['cargo']['solar_array']).to eq 2
      expect(subject.first.trunk['cargo']['unpressurized_cargo']).to eq true
      expect(subject.first.height_w_trunk['meters']).to eq 7.2
      expect(subject.first.height_w_trunk['feet']).to eq 23.6
      expect(subject.first.diameter['meters']).to eq 3.7
      expect(subject.first.diameter['feet']).to eq 12
      expect(subject.first.wikipedia).to eq 'https://en.wikipedia.org/wiki/SpaceX_Dragon'
      expect(subject.first.description).to start_with 'Dragon is a reusable spacecraft developed'

      expect(subject[1].capsule_id).to eq 'dragon2'
      expect(subject[1].name).to eq 'Dragon 2'
    end
  end

  context "#info('dragon1')", vcr: { cassette_name: 'dragon_capsules/info/dragon1' } do
    subject do
      SPACEX::DragonCapsules.info('dragon1')
    end

    it 'returns Dragon Capsule info for "dragon1"' do
      expect(subject.capsule_id).to eq 'dragon1'
      expect(subject.name).to eq 'Dragon 1'
      expect(subject.type).to eq 'capsule'
      expect(subject.active).to eq true
      expect(subject.crew_capacity).to eq 0
      expect(subject.sidewall_angle_deg).to eq 15
      expect(subject.orbit_duration_yr).to eq 2
      expect(subject.dry_mass_kg).to eq 4_200
      expect(subject.dry_mass_lb).to eq 9_300
      expect(subject.first_flight).to eq '2010-12-08'
      expect(subject.heat_shield).to eq ({ 'material' => 'PICA-X', 'size_meters' => 3.6, 'temp_degrees' => 3000, 'dev_partner' => 'NASA' })
      expect(subject.heat_shield['material']).to eq 'PICA-X'
      expect(subject.heat_shield['size_meters']).to eq 3.6
      expect(subject.heat_shield['temp_degrees']).to eq 3_000
      expect(subject.heat_shield['dev_partner']).to eq 'NASA'
      expect(subject.thrusters[0]['type']).to eq 'Draco'
      expect(subject.thrusters[0]['amount']).to eq 18
      expect(subject.thrusters[0]['pods']).to eq 4
      expect(subject.thrusters[0]['fuel_1']).to eq 'nitrogen tetroxide'
      expect(subject.thrusters[0]['fuel_2']).to eq 'monomethylhydrazine'
      expect(subject.thrusters[0]['thrust']['kN']).to eq 0.4
      expect(subject.thrusters[0]['thrust']['lbf']).to eq 90
      expect(subject.launch_payload_mass['kg']).to eq 6_000
      expect(subject.launch_payload_mass['lb']).to eq 13_228
      expect(subject.launch_payload_vol['cubic_meters']).to eq 25
      expect(subject.launch_payload_vol['cubic_feet']).to eq 883
      expect(subject.return_payload_mass['kg']).to eq 3_000
      expect(subject.return_payload_mass['lb']).to eq 6_614
      expect(subject.return_payload_vol['cubic_meters']).to eq 11
      expect(subject.return_payload_vol['cubic_feet']).to eq 388
      expect(subject.pressurized_capsule['payload_volume']['cubic_meters']).to eq 11
      expect(subject.pressurized_capsule['payload_volume']['cubic_feet']).to eq 388
      expect(subject.trunk['trunk_volume']['cubic_meters']).to eq 14
      expect(subject.trunk['trunk_volume']['cubic_feet']).to eq 494
      expect(subject.trunk['cargo']['solar_array']).to eq 2
      expect(subject.trunk['cargo']['unpressurized_cargo']).to eq true
      expect(subject.height_w_trunk['meters']).to eq 7.2
      expect(subject.height_w_trunk['feet']).to eq 23.6
      expect(subject.diameter['meters']).to eq 3.7
      expect(subject.diameter['feet']).to eq 12
      expect(subject.wikipedia).to eq 'https://en.wikipedia.org/wiki/SpaceX_Dragon'
      expect(subject.description).to start_with 'Dragon is a reusable spacecraft developed by Space'
    end
  end
end
