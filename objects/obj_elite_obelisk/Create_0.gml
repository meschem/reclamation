
age = 0
mapIcon = spr_poi_obelisk

floats = false

activationArea = {
	x1: -60,
	x2: 60,
	y1: -40,
	y2: 40
}

charge = 0
chargeMax = 100
chargeBarInst = noone
chargeBarInfo = {
	setup: false,
	yPos: 0,
	xPos: 0,
	width: 40,
	yOffset: 10,
	bgColor: get_color(colors.dark_purple),
	fillColor: get_color(colors.orange)
}

baddies = [
	obj_cyclo_skeleton,
	obj_skeleton_warrior,
	obj_boarrior,
	obj_slime_green,
	obj_slime_blue,
	obj_wraith,
	obj_zombie_elite,
	obj_skull_head_ruby,
	obj_reaper
]

drawUiLoc = get_ui_pos(id)
drawUiLoc.y -= 40
drawString = $"{charge} / {chargeMax}"

activate = function() {
	var _spawn = array_random(baddies)
	
	// this ultimate spawns one, and enhance_baddie() creates the supporting  units
	var _spawns = spawn_baddie(_spawn, 1, 20)
	
	for (var i = 0; i < array_length(_spawns); i++) {
		create_elite_health_bar(_spawns[i])
		enhance_baddie(baddieSpecialTypes.elite, _spawns[i])
		apply_random_elite_buff(_spawns[i])
	}
	
	instance_destroy()
}
