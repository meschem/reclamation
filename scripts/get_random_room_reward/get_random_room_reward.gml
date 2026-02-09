///@description					Gets a random reward type
///@param {array} _exclusions	roomRewards to exclude
///@return {real}
function get_random_room_reward(_exclusions = []){
	var _rewards = []
	
	if (!array_contains(_exclusions, roomRewards.trinket)) {
		repeat (5) {
			array_push(_rewards, roomRewards.trinket)
		}
	}
	
	if (!array_contains(_exclusions, roomRewards.abilityLevel)) {
		repeat (3) {
			array_push(_rewards, roomRewards.abilityLevel)
		}
	}
	
	if (!array_contains(_exclusions, roomRewards.fullHeal)) {
		repeat (2) {
			array_push(_rewards, roomRewards.fullHeal)
		}
	}
	
	if (!array_contains(_exclusions, roomRewards.weaponUpgrade)) {
		repeat (2) {
			array_push(_rewards, roomRewards.weaponUpgrade)
		}
	}
	
	return array_random(_rewards)
}
