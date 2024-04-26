///@description				Gets player-readable room reward from enum
///@param {real} _reward	Reard from enum roomRewards
///@return {string}
function get_room_reward_from_enum(_reward) {
	switch (_reward) {
		case roomRewards.abilityLevel:
			return "Ability Level"
			
		case roomRewards.fullHeal:
			return "Full Heal"
			
		case roomRewards.trinket:
			return "Trinket"
			
		case roomRewards.weaponUpgrade:
			return "Weapon Upgrade"
	}
}