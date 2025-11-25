function activate_storm_aura() {
	//var inst = instance_create_depth(obj_player.x, obj_player.y, depths.fx, obj_particle)
	
	curCd = maxCd
	
	var actualRadius = radius * get_player_stat(enumPlayerStats.areaOfEffectScalar) // runes[enumRunes.voldan].enabled ? (radius / 2) : radius
	var baseDamage = damage // runes[enumRunes.voldan].enabled ? (damage * 3) : damage
	var appliedDamage = 1
	var projectiles = projectileCount + get_player_stat(enumPlayerStats.bonusProjectileCount)
	
	var inst = create_fx_fading_circle(obj_player.x, obj_player.y, actualRadius)
	
	inst.alphaStart = 0.3

	var target
	var killed
	var enemies = ds_list_create()	
	var count = collision_circle_list(
		obj_player.x,
		obj_player.y,
		actualRadius,
		obj_baddie,
		false,
		true,
		enemies,
		false
	)
	
	if (count > 0) {
		ds_list_shuffle(enemies)
		
		var critHit = statBonusCuttingBolts.active
		
		for (var i = 0; i < min(count, projectiles); i++) {
		    target = enemies[| i]
			
			inst = instance_create_depth(target.x, target.y, depths.fx, obj_particle_single_cycle)
			inst.sprite_index = spr_particle_lightning_medium

			if (statBonusShocking.active) {
				target.debuffShockAmount += 120
			}
			
			if (statBonusGiantSlayer.active && (target.isBoss || target.isElite)) {
				appliedDamage = baseDamage + giantSlayerBonusDamage
			} else {
				appliedDamage = baseDamage
			}
			
			damage_baddie_with_type(target, appliedDamage, enumDamageTypes.lightning, owner, critHit)
			
			critHit = false
		}
	}

	ds_list_destroy(enemies)
}