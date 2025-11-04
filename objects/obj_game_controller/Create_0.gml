/// @description Init

gameFrame = 0
debugMode = true

global.masterGain = 1
global.createDeathParticles = true
global.createParticleFx = true
global.playerCount = 1

activeAbilityControllers = []
baddieTargets = [] // used for targeting by baddies
levelUpRewardTable = []

init_run_globals()

display_reset(8, true)

//Create Controllers
instance_create_depth(100, 0, depths.ui, obj_trinket_controller)
create_instance(obj_toaster_controller)
create_instance(obj_run_controller)
create_instance(obj_input_controller)
create_instance(obj_recipe_controller)
create_instance(obj_player_stat_controller)
create_instance(obj_text_controller)

//if (debug_mode) {
	create_instance(obj_debug_controller)
//}

spawn_players()

define_colors()
define_item_stats()
define_characters()
define_level_xp_table()
define_level_up_rewards()

window_set_cursor(cr_none)

cursor_sprite = spr_cursor_aiming
