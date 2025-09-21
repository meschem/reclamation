/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Unstable Mass"
description = "Violatile and ready to burst."

bonusStr = 5
bonusInt = 2

damage = 50

addCharStatBlocks()

stats = [
	new itemStat(
		enumItemStats.custom,
		[damage],
		true, 
		{
			displayName: "Retaliation AOE Dmg", 
			unitEnum: statUnits.none,
			prepend: damage
		}
	)
]

onEquip = function() {
	add_on_hit_ability_to_player(id)
}

onUnequip = function() {
	remove_on_hit_ability_from_player(id)
}

onDestroy = function() {
	remove_on_hit_ability_from_player(id)
}

activateOnHit = function(_hitBy) {
	damage_baddies_in_radius(new vec2(owner.x, owner.y), 100, damage, owner)
	
	obj_camera_controller.applyShake()
		
	audio_play_sound(snd_thunder_slam, 0, false, 0.6)
	
	var _inst = instance_create_depth(owner.x, owner.y, depths.fx, obj_particle_single_cycle)
	_inst.sprite_index = spr_orange_explosion
	_inst.image_xscale = 2
	_inst.image_yscale = 2
	_inst.image_speed = 1.5
}
