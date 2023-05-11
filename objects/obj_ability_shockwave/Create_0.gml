/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited();

name = "Shockwave"
description = "Enhances attacks to deal a cone of damage in front of them"
onStrikeAbility = true

treeLevel = 3

///@description					Creates a shockwave at the location of the projectile
///@param {id.Instance} inst	Instance that will be referenced for creating FX		
activate = function(inst) {
	activate_shockwave(
		level,
		inst.x,
		inst.y,
		point_direction(0, 0, inst.xVel, inst.yVel)
	)
}
