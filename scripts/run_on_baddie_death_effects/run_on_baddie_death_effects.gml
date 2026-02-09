///@description							Iterates through items to do stuff
///@param {id.Instance} _target			Target dying
function run_on_baddie_death_effects(_target) {
	// FIXME: Defaults to first player, doesn't send killer
	var _owner = get_first_player()
	
	// FIXME: Perf, iterate through equipped slots?
	with (obj_equipment) {
		if (owner == _owner && equipped) {
			onBaddieDeath({
				_target
			})
		}
	}
}
