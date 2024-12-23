///@description						Returns all available trinkets that could be acquired or leveled up
///@param {id.Instance} _player		Player to check for 
///@param {real} _type				Type of upgrades. Uses enum weaponUpgradeTypes.
///@return {array<id.Instance>}

function get_available_weapon_upgrades(_player = noone, _type = weaponUpgradeTypes.minor) {
	var availableUpgrades = []
	var _weaponUpgrades
	
	if (_player == noone) {
		_player = obj_player // get_player_target()
	}
	
	switch (_type) {
		case weaponUpgradeTypes.minor:
			_weaponUpgrades = _player.equipment.weapon.upgradesMinor
		break
		
		case weaponUpgradeTypes.major:
			_weaponUpgrades = _player.equipment.weapon.upgradesMajor
		break
		
		case weaponUpgradeTypes.evolution:
			_weaponUpgrades = _player.equipment.weapon.upgradesEvolution
		break
	}
	
	//weaponUpgrades = _player.equipment.weapon.upgrades

	for (var i = 0; i < array_length(_weaponUpgrades); i++) {
		if (_weaponUpgrades[i].stackable || _weaponUpgrades[i].level == 0) {
			if (_weaponUpgrades[i].level < _weaponUpgrades[i].maxLevel) {
				array_push(availableUpgrades, _weaponUpgrades[i])
			}
		}
	}
	
	return availableUpgrades
}
