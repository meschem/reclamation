///@description						Creates instances for available abilities
///									Currently just loads all available abilities from the controller
/// param {id.Instance} _player		Player instance, currently irrelevant
function load_abilities_for_hero(_player) {
	var _ability = noone
	var _controller = create_instance(obj_ability_controller)
	
	_controller.owner = _player
	
	with (obj_ability_controller) {
		for (var i = 0; i < array_length(allAbilities); i++) {
			_inst = create_instance(allAbilities[i])
						
			array_push(availableAbilities, _inst)
		}
		
		if (_player.activeAbility != obj_none) {
			_inst = create_instance(_player.activeAbility)
			_inst.levelUp()
		}
	}
}
