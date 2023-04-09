/// @description	Description
/// @param {real}	level
function activate_charge(level) {
	with (obj_player) {
		isCharging = true
		chargeMaxLength = 120
		chargeCurrentFrame = 0
	}
}