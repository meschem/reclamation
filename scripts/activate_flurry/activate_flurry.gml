/// @description  Damages and pushes back units in an AOE
/// @param {real} level

function activate_flurry(level) {
	var inst = create_instance(obj_jonah_flurry_caster)
	
	if (obj_ability_flurry.runes[enumRunes.magdela].enabled) {
		with (inst) {
			maxCd = 8
			facingAngle = obj_player.attackAngle
			totalSpread = 180
			splitFromMiddle = true
			

		}
	} else {
		with (inst) {
			maxCd = 5
			facingAngle = obj_player.attackAngle
			totalSpread = 30
			
			//create_debug_arrow(obj_player.x, obj_player.y, facingAngle)
		}
	}
	
	inst.maxAttacks += obj_player.bonusProjectileCount
}
