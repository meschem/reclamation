/// @description   Description
/// @params {real}	amount	Amount of HP. 10 per bar.
function add_player_health(amount) {
	obj_player.hp = min(amount + obj_player.hp, obj_player.maxHp)
}
