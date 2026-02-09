///@description					Adds baddie to list of targets
///@param {id.Instance} _inst	Instance to add to valid targets for baddies
function add_player_target(_inst) {
	array_push(obj_game_controller.baddieTargets, _inst)
}
