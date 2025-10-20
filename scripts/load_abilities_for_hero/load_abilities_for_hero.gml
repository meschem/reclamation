///@description						Creates instances for available abilities
///									Currently just loads all available abilities from the controller
/// param {id.Instance} _player		Player instance, currently irrelevant
function load_abilities_for_hero(_player) {
	var _ability = noone
	var _controller = create_instance(obj_ability_controller)
	var _inst = noone
	
	_controller.owner = _player
	
	with (obj_ability_controller) {
		for (var i = 0; i < array_length(_player.availableAbilities); i++) {
			_inst = create_instance(_player.availableAbilities[i])
				
			array_push(availableAbilities, _inst)
		}
		
		for (var i = 0; i < array_length(_player.availableUltimateAbilities); i++) {
			_inst = create_instance(_player.availableUltimateAbilities[i])
				
			array_push(availableUltimateAbilities, _inst)
		}
		
		if (_player.activeAbility != obj_none) {
			_inst = create_instance(_player.activeAbility)
			_inst.levelUp()
		}
	}
}
