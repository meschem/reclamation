/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "War Bracer"
description = "Strong bracer"

bonusStr = 2
cdMax = stf(60)
cd = 0
active = true

statsSpecial = ["Negates 1 damage. 60 second cooldown."]

onStep = function() {
	if (!active) {
		cd++
	}
	
	if (cd >= cdMax) {
		active = true
		cd = 0
	}
	
	sprite_index = active ? spr_icon_war_bracer : spr_icon_war_bracer_inactive
}

activate = function() {
	active = false
	cd = 0
}