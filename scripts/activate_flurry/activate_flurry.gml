/// @description  Damages and pushes back units in an AOE
/// @param {real} level

function activate_flurry(level) {
	var inst = create_instance(obj_jonah_flurry_caster)
	
	with (inst) {
		maxCd = 5
		facingAngle = obj_player.attackAngle
		totalSpread = 30
	}
}