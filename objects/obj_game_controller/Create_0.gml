/// @description Init

gameFrame = 0
debugMode = true

/// FIXME DEBUG

//audio_set_master_gain(0, 0)

//talents = []

activeAbilityControllers = []

init_run_globals()

display_reset(8, true)

//Create Controllers
//create_instance(obj_trinket_controller)
instance_create_depth(100, 0, depths.ui, obj_trinket_controller)
create_instance(obj_toaster_controller)
create_instance(obj_run_controller)
//create_instance(obj_camera_controller)

//init_talents_jonah()
define_colors()
define_item_stats()
//set_available_talents()

// some of these will need to be made global

//playerTotalGold = 0
//playerGold = 0
//playerXp = 0
//playerLevel = 1
//playerAbilityTreeLevel = 1

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

enum levelUpRewards {
	abilitySelect,
	weaponUpgrade,
	heroTalent,
	statPoint,
	trinket,
	rune,
	abilityLevelUp
}

levelUpRewardTable = [
	levelUpRewards.abilitySelect,
	levelUpRewards.trinket,
	levelUpRewards.abilitySelect,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilitySelect,
	levelUpRewards.trinket,
	levelUpRewards.abilitySelect,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
]

window_set_cursor(cr_none)

cursor_sprite = spr_cursor_aiming

spawn_player()
