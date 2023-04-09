///@description Adds a weapon to a player object
///@param1 {playerWeapons}

function add_weapon(playerWeapon) {
	ds_list_add(weaponList, playerWeapon)
	
	switch (playerWeapon) {
		case playerWeapons.warHammer:
			warHammerEquipped = true
			warHammerCdMax = 25
			warHammerCdCur = 0
			warHammerLevel = 1
			break;
		
		case playerWeapons.dagger:
			daggerEquipped = true
			daggerCdMax = 10
			daggerCdCur = 0
			daggerLevel = 1
			break;
		
	}
}