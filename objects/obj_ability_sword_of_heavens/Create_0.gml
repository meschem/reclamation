/*
	Ability objects contain referential information.
*/

///@description		Init

// Inherit the parent event
event_inherited()

name = "Sword of the Heavens"
description = "Rains down swords over the battlefield"
//selectionIcon = spr_abil_select_icon_war_stomp
active = true
ultimate = true

curCd = 0
maxCd = 60
treeLevel = 1

autoCast = false
canAutoCast = false

radius = 80
baseDamage = [100, 150, 200]
swordCount = [4, 5, 6]
maxLevel = 3

stats = [
	new abilityStat(
		"Damage",
		"baseDamage",
		baseDamage
	),
	new abilityStat(
		"Sword Count",
		"swordCount",
		swordCount
	)
]

use = function() {
	var _pos = new vec2()
	
	for (var i = 0; i < swordCount[level - 1]; i++ ) {
		if (get_combat_room_type() == combatRoomTypes.dungeon) {
			_pos = get_random_play_point()
		} else {
			_pos = get_random_point_in_circle(
				owner.x,
				owner.y,
				180,
				false
			)
		}
		
		var _inst = instance_create_depth(_pos.x, _pos.y, depths.playerProjectile, obj_jonah_heaven_sword_spawner)
		_inst.owner = owner
		_inst.startDelay = 10 + (i * 30)
	}
}

///@param {struct.vec2}	_pos		Position to apply landing effects
onSwordLand = function(_pos) {
	obj_camera_controller.applyShake()
	
	inst = create_fx_fading_circle(_pos.x, _pos.y, radius, 30)
	inst.alphaStart = 0.4
		
	audio_play_sound(snd_thunder_slam, 0, false, 0.6)
	
	damage_baddies_in_radius(
		_pos, radius, baseDamage[level - 1], owner
	)
}
