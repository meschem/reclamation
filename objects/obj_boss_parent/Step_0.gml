
// Inherit the parent event
event_inherited()

if (game_is_paused()) {
	return 0
}

// damageStage stuff... will want to set up a system for this

//if (damageStage == 0 && hp / hpMax < 0.66) {
//	damageStage = 1
//	image_index = 1
//	instance_create_depth(x - 5, y + 30, depths.enemy, obj_hydra_head_red)
//} else if (damageStage == 1 && hp / hpMax < 0.33) {
//	damageStage = 2
//	image_index = 2
//	instance_create_depth(x + 5, y + 30, depths.enemy, obj_hydra_head_red)
//}

if (hp <= 0 && !isDying) {
	if (bsm.deathState == -1) {
		show_message("no death state found")
		instance_destroy()
		return 0
	}
	
	bsm.changeState(bsm.deathState)
}

bsm.runStep()
