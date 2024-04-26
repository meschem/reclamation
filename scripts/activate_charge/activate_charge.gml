/// @description					Tells the player to charge
/// @param {id.Instance} _player	Charging Player
function activate_charge(_player) {
	with (_player) {
		isCharging = true
		chargeMaxLength = obj_ability_charge.maxLength
		chargeCurrentFrame = 0
	}
}