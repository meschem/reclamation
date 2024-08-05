/// @description Init

gameFrame = 0
debugMode = true

global.masterGain = 1
global.createDeathParticles = true
global.createParticleFx = true

/// FIXME DEBUG

//audio_set_master_gain(0, 0)

//talents = []

//random_set_seed(4)

activeAbilityControllers = []
baddieTargets = [] // used for targeting by baddies

init_run_globals()

display_reset(8, true)

//Create Controllers
//create_instance(obj_trinket_controller)
instance_create_depth(100, 0, depths.ui, obj_trinket_controller)
create_instance(obj_toaster_controller)
create_instance(obj_run_controller)
create_instance(obj_input_controller)
//create_instance(obj_camera_controller)

//init_talents_jonah()
define_colors()
define_item_stats()
//set_available_talents()

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
	16000,
	19000,
	22000,
	25000,
	29000,
	33000,
	37000,
	41000,
	45000,
	50000,
	55000,
	60000,
	76000,
	83000,
	90000,
	100000,
	110000,
	120000,
	130000,
	140000,
	150000,
	170000,
	190000,
	210000,
	250000,
	300000,
	350000,
	400000,
	450000,
	500000
	
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
	//levelUpRewards.weaponUpgrade,
	//levelUpRewards.weaponUpgrade,
	//levelUpRewards.weaponUpgrade,
	//levelUpRewards.weaponUpgrade,
	//levelUpRewards.weaponUpgrade,
	
	levelUpRewards.abilitySelect,
	levelUpRewards.abilitySelect,
	levelUpRewards.trinket,
	levelUpRewards.abilitySelect,
	levelUpRewards.weaponUpgrade,
	levelUpRewards.abilitySelect,
	
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.weaponUpgrade,
	levelUpRewards.trinket,
	
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.weaponUpgrade,
	levelUpRewards.trinket,
	
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.weaponUpgrade,
	levelUpRewards.trinket,
	
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.weaponUpgrade,
	levelUpRewards.trinket,
	
	levelUpRewards.abilityLevelUp,
	levelUpRewards.trinket,
	levelUpRewards.abilityLevelUp,
	levelUpRewards.weaponUpgrade,
	levelUpRewards.trinket,
]

window_set_cursor(cr_none)

cursor_sprite = spr_cursor_aiming

var _inst = spawn_player()

add_player_target(_inst)

