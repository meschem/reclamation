/// @description Init

gameFrame = 0

talents = []

activeAbilityControllers = []

init_run_globals()

//init_talents_jonah()
define_colors()
set_available_talents()

// some of these will need to be made global

playerTotalGold = global.playerTotalGold
playerGold = global.playerGold
playerXp = global.playerXp
playerLevel = global.playerLevel
playerAbilityTreeLevel = global.abilityTreeLevel

playerXpLevelTable = [
	250,
	500,
	750,
	1000,
	1250,
	1500,
	2000,
	2500,
	3000,
	3500,
	4000,
	5000,
	6000,
	7000,
	8000,
	9000,
	10000,
	12000,
	14000,
	16000
]

levelUpRewardTable = [
	levelUpRewards.abilitySelect,
	levelUpRewards.heroTalent,
	levelUpRewards.abilitySelect,
	levelUpRewards.abilitySelect,
	levelUpRewards.abilitySelect,
	levelUpRewards.abilitySelect
]

window_set_cursor(cr_none)

cursor_sprite = spr_cursor_aiming

spawn_player()
//spawn_ability_trees()

process_all_talents()
