/// @description   Description
/// @param {real}	amount	Amount to add

function add_gold(amount) {
	var player = get_player_target()
	
	player.gold += amount
	player.totalGold += amount
}