/// @description  Damages and pushes back units in an AOE
/// @param {real} level

function activate_war_stomp_active(level) {
	if (level < 0) {
		return 0
	}
	
	with (obj_player) {
		var target = noone
		var inst = noone
		var pushAngle = 0
		//var target, inst, pushAngle
		var enemies = ds_list_create()
		var _owner = id
		var _abilityObj = noone
		
		with (obj_ability_war_stomp_active) {
			if (owner == _owner) {
				_abilityObj = id
			}
		}		

		var radius = _abilityObj.baseRadius[_abilityObj.level - 1]
		var amount = _abilityObj.baseDamage[_abilityObj.level - 1]
		//var pushDistance = _abilityObj.runes[enumRunes.voldan].enabled ? 40 : 0
		var pushDistance = 0
		var stunLength = _abilityObj.stunLength[_abilityObj.level - 1]

		var count = collision_circle_list(
			x,
			y,
			radius,
			[obj_baddie, obj_enemy_projectile, obj_destructible],
			false,
			true,
			enemies,
			false
		)
	
		inst = create_fx_fading_circle(x, y, radius, 30)
		inst.alphaStart = 0.4
		
		obj_camera_controller.applyShake()
		
		audio_play_sound(snd_thunder_slam, 0, false, 0.6)

		if (count > 0) {
			if (_abilityObj.statBonusEchoingPain.active) {
				var dmgScalePerEnemy = 0.10
				var maxEnemyCount = 20
				var bonusDamage = amount * min(count, maxEnemyCount) * dmgScalePerEnemy

				amount += bonusDamage
			}
			
			for (var i = 0; i < count; i++) {
				target = enemies[| i]
				
				if (object_is_ancestor(target.object_index, obj_enemy_projectile)) {
					if (target.z <= 2) {
						target.onDeflect(point_direction(x, y, target.x, target.y))
						
						if (instance_exists(target.owner) && _abilityObj.statBonusReflection.active) {
							var _angle = point_direction(target.x, target.y, target.owner.x, target.owner.y)
							launch_projectile_from_point(obj_reflected_orb, _angle, 2.5, target.x, target.y)
						}
						
						instance_destroy(target)
					}
				} else {
				    target = enemies[| i]			
					pushAngle = point_direction(x, y, target.x, target.y)

					knockback_baddie(target, pushDistance, pushAngle)
					stun_baddie(target, 2)
			
					inst = instance_create_depth(target.x, target.y, depths.fx, obj_particle_single_cycle)
					inst.sprite_index = spr_particle_lightning_medium

					with (obj_ability_war_stomp_active) {
						if (id == _abilityObj) {
							damage_baddie(target, amount, false, 2, 1.5)
						}
					}
					
				}
			}
		}
		
		if (_abilityObj.statBonusAftershock.active) {
			instance_create_depth(
				obj_player.x,
				obj_player.y,
				depths.playerProjectile,
				obj_jonah_stomp_aftershock
			)
		}

		ds_list_destroy(enemies)
	}
}