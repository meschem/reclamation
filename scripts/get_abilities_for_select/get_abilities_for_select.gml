///@description						Gets abilities available for the player to select
///@param {id.Instance} _player		Player to get abilities from
function get_abilities_for_select(_player) {
	var _abils = []
	var _tree = noone
	var _abilIndex = _player.abilityTreeLevel - 1
	
	with (_player) {
		for (var i = 0; i < array_length(abilityTrees); i++) {
			_tree = abilityTrees[i]
			
			if (array_length(_tree.abilities) >= _abilIndex + 1) {
				array_push(_abils, _tree.abilities[_abilIndex])
			}
		}
	}
	
	return _abils
}
