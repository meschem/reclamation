/*
	Ability objects contain referential information.
*/

// Inherit the parent event
event_inherited()

name = "Chain Lightning"
description = "Shoots out a bolt of lightning that bounces between targets"
icon = spr_ability_icon_war_stomp
maxCharges = 3
active = true

curCd = 0
maxCd = 400

treeLevel = 2

damage = 20
maxDistance = 250
criticalDistance = 60

use = function() {
	var target = instance_nearest(obj_player.x, obj_player.y, obj_baddie)
	
	var distance = point_distance(obj_player.x, obj_player.y, target.x, target.y)
	
	if (target != noone) {
		var inst = instance_create_depth(target.x, target.y, depths.fx, obj_particle_single_cycle)
		
		if (distance < criticalDistance) {
			inst.sprite_index = spr_particle_lightning_medium	
			inst.image_xscale = 1.5
			inst.image_yscale = 1.5
			
			damage_baddie(target, damage * 2, true)
		} else if (distance < maxDistance) {
			inst.sprite_index = spr_particle_lightning_medium	

			damage_baddie(target, damage)
		}
	}
}
