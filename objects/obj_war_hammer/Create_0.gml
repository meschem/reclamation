/// @description Init

event_inherited()

//projectileType = projectileTypes.weapon

angleSpriteToVelocity = true

distanceMax = 150

damageDirect = 30

targetsHit = 0
targetsMax = 1
damageLostPerTarget = 10

damageFrameCooldown = 120

// damageFrameCooldown = 60 // not used yet...

create_ribbon(id, obj_ribbon, 18, 6)

knockback = 16

shadowSprite = spr_war_hammer_shadow

onCollideFx = function(_target = noone)
{
	spawn_fx_small_burst(x, y)
	
	var _inst = instance_create_depth(_target.x, _target.y, depths.fx, obj_particle_additive_single_cycle)
	var _angle = random(360)
	_inst.sprite_index = spr_particle_long_cut_flash_blur	
	_inst.image_angle = _angle
	
	_inst = instance_create_depth(_target.x, _target.y, depths.fx, obj_particle_additive_single_cycle)
	_inst.sprite_index = spr_particle_long_cut_flash	
	_inst.image_angle = _angle
	
	var _gain = random_range(0.9, 1.1)
	var _pitch = random_range(0.93, 1.07)
	var _snd = snd_thud_impact
	
	if (_target != noone) {
		if (variable_instance_exists(_target, "impactMaterial")) {
			switch (_target.impactMaterial) {
				case enumImpactMaterials.flesh:
					_gain = random_range(1.28, 1.42)
					_snd = snd_sticky_impact
				break
				
				case enumImpactMaterials.bone:
					_snd = snd_med_crunch
					audio_play_sound(snd_heavy_hit, 0, false, _gain, 0, _pitch)	
				break
			}
		}
	}
	
	audio_play_sound(_snd, 0, false, _gain, 0, _pitch)	
}
