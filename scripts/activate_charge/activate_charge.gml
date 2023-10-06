/// @description	Description
/// @param {real}	level
function activate_charge(level) {
	with (obj_player) {
		isCharging = true
		chargeMaxLength = obj_ability_charge.maxLength
		chargeCurrentFrame = 0
	}
}