/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "War Bracer"
description = "Strong bracer"

bonusStr = [1, 2, 5]
cdMax = [stf(60), stf(50), stf(40)]
cd = 0
active = true

stats = [
    create_custom_item_stat(cdMax, "Cooldown", statUnits.frames)
]

statsSpecial = ["Negates 1 damage. 60 second cooldown."]

onStep = function() {
	if (!active) {
		cd++
	}
	
	if (cd >= cdMax[level - 1]) {
		active = true
		cd = 0
	}
	
	sprite_index = active ? spr_icon_war_bracer : spr_icon_war_bracer_inactive
}

activate = function() {
	active = false
	cd = 0
}