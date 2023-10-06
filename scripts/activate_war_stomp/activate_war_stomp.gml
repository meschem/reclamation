/// @description  Damages and pushes back units in an AOE
/// @param {real} level

function activate_war_stomp(level) {
	with (obj_player) {
		var target, inst, pushAngle
		var enemies = ds_list_create()

		var radius = obj_ability_war_stomp.baseRadius
		var amount = obj_ability_war_stomp.baseDamage
		var pushDistance = obj_ability_war_stomp.runes[enumRunes.voldan].enabled ? 10 : 0
		var stunLength = obj_ability_war_stomp.stunLength

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

		if (count > 0) {
			if (obj_ability_war_stomp.runes[enumRunes.dreygoth].enabled) {
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

				damage_baddie(target, amount)
			}
		}
		
		if (obj_ability_war_stomp.runes[enumRunes.magdela].enabled) {
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