///@description				Adds a talent to the available pool
///@param		{real}		talentEnum
///@param		{string}	name
///@param		{real}		heroEnum
///@param		{real}		maxLevel

function add_talent_to_pool(talentEnum, name, heroEnum = heroes.any, maxLevel = 3) {
	with (obj_game_controller) {
		talents[talentEnum][talentProps.enabled] = true
		talents[talentEnum][talentProps.hero] = heroEnum
		talents[talentEnum][talentProps.name] = name
		talents[talentEnum][talentProps.curLevel] = 0
		talents[talentEnum][talentProps.maxLevel] = maxLevel
		talents[talentEnum][talentProps.levelRequirement] = 0
		talents[talentEnum][talentProps.talentRequirement] = -1
		talents[talentEnum][talentProps.rarity] = 2
	}
}