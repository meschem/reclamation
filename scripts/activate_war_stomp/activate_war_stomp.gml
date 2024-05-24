/// @description  Damages and pushes back units in an AOE
/// @param {real} level

function activate_war_stomp(level) {
	with (obj_player) {
		var target, inst, pushAngle
		var enemies = ds_list_create()
		var _owner = id
		var _abilityObj = noone
		
		with (obj_ability_war_stomp) {
			if (owner == _owner) {
				_abilityObj = id
			}
		}		

		var radius = _abilityObj.baseRadius[_abilityObj.level - 1]
		var amount = _abilityObj.baseDamage[_abilityObj.level - 1]
		var pushDistance = _abilityObj.runes[enumRunes.voldan].enabled ? 10 : 0
		var stunLength = _abilityObj.stunLength[_abilityObj.level - 1]

		var count = collision_circle_list(
			x,
			y,
			radius,
			obj_baddie,
			false,
			true,
			enemies,
			false
		)
	
		//var fxCircle = spawn_fx_circle(radius)
		
		inst = create_fx_fading_circle(x, y, radius, 30)
		inst.alphaStart = 0.4
		
		obj_camera_controller.applyShake()
		
		audio_play_sound(snd_thunder_slam, 0, false, 0.6)

		if (count > 0) {
			if (_abilityObj.runes[enumRunes.dreygoth].enabled) {
				var dmgScalePerEnemy = 0.10
				var maxEnemyCount = 10
				var bonusDamage = amount * min(count, maxEnemyCount) * dmgScalePerEnemy

				amount += bonusDamage
			}
			
			for (var i = 0; i < count; i++)
			{
			    target = enemies[| i]			
				pushAngle = point_direction(x, y, target.x, target.y)

				knockback_baddie(target, pushDistance, pushAngle)
				stun_baddie(target, 2)
			
				inst = instance_create_depth(target.x, target.y, depths.fx, obj_particle_single_cycle)
				inst.sprite_index = spr_particle_lightning_medium

				damage_baddie(target, amount, false, 2, 1.5)
			}
		}
		
		if (_abilityObj.runes[enumRunes.magdela].enabled) {
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