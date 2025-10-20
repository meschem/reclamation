///@description					Creates hit stun
///@param {real} _amount		Amount to set
function create_hit_stun(_amount) {
	with (obj_room_controller) {
		createHitStun(_amount)
	}
}