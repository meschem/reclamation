///@description						Initiates damage and bouncing effect of chain lightning
///@param {id.Instance} projectile	Lightning projectile
///@param {id.Instance} target		Target that was hit
///@param {real} respawnCount		respawns left

function chain_lightning_collide(projectile, target) {
	var endPoint = new vec2(x, y)
	var inst, bolt
	
	if (target != noone) {
		endPoint.x = target.x
		endPoint.y = target.y
	}
	
	inst = instance_create_depth(target.x, target.y, depths.fx, obj_particle_single_cycle)
	inst.sprite_index = spr_particle_32_circle_boom
	
	// FIXME: ERROR - Possible projectile does not exist at this point
	create_chain_lightning_fx(projectile.spawnPoint, endPoint)
	
	if (projectile.respawnCount == 0) {
		return 0
	}
	
	if (obj_ability_shock.runes[enumRunes.dreygoth].enabled) {
		bolt = instance_create_depth(
			obj_player.x,
			obj_player.y,
			depths.playerProjectile,
			obj_chain_lit_bolt
		)

		var angle = point_direction(bolt.x, bolt.y, target.x, target.y)
		var velocity = get_velocity_from_angle(angle, bolt.moveSpeedMax)

		bolt.xVel = velocity[0]
		bolt.yVel = velocity[1]
		bolt.seekTarget = target
		bolt.respawnCount = projectile.respawnCount - 1
	} else if (target != noone) {
		var dist = 0
		var closestDist = projectile.bounceDistanceMax
		var boltHitList = projectile.hitList
		var closestInst = noone
		var sourcePoint = new vec2(x, y)
		
		//FIXME Optimize
		with (obj_baddie) {
			if (!hitlist_contains(boltHitList, id)) {
				dist = point_distance(x, y, sourcePoint.x, sourcePoint.y)
			
				if (dist < closestDist)
					closestInst = id
			}
		}
		
		if (closestInst != noone) {
			bolt = instance_create_depth(
				target.x,
				target.y,
				depths.playerProjectile,
				obj_chain_lit_bolt
			)

			var angle = point_direction(bolt.x, bolt.y, closestInst.x, closestInst.y)
			var velocity = get_velocity_from_angle(angle, bolt.moveSpeedMax)

			bolt.xVel = velocity[0]		
			bolt.yVel = velocity[1]		
			bolt.seekTarget = closestInst
			bolt.respawnCount = projectile.respawnCount - 1
			bolt.hitList = projectile.hitList
			
			//show_message("collision: " + string(inst.respawnCount))

			array_push(bolt.hitList, new hitListEntry(target, 999))
		}
	}
}