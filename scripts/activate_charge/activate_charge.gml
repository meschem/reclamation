/// @description					Tells the player to charge
/// @param {id.Instance} _player	Charging Player
function activate_charge(_player) {
	with (_player) {
		state = playerStates.charging
		chargeMaxLength = obj_ability_charge.maxLength
		chargeCurrentFrame = 0
	}
}