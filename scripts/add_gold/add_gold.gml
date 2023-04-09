/// @description   Description
/// @param {real}	amount	Amount to add

function add_gold(amount) {
	obj_game_controller.playerGold += amount
	obj_game_controller.playerTotalGold += amount
}