/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

attackAngle = 0
timer = seconds_to_frames(0.2)

onRemove = function() {
	with (owner) {
		equipment.weapon.attack(attackAngle, true, false)
	}
}
