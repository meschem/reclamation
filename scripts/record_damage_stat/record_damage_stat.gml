///@description   Description
///@param {id.Instance} _source		Source of damage. Can be ability or weapon
///@param {real} _amount			Amount of damage dealt
function record_damage_stat(_source, _amount) {	
	if (!variable_instance_exists(_source, "damageDealt")) {
		_source.damageDealt = 0	
	}
	
	_source.damageDealt += _amount
}