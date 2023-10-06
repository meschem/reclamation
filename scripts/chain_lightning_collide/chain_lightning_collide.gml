///@description						Initiates damage and bouncing effect of chain lightning
///@param {id.Instance} projectile	Lightning projectile
///@param {id.Instance} target		Target that was hit
///@param {real} respawnCount		respawns left

function chain_lightning_collide(projectile, target) {
	var endPoint = new vec2(x, y)
	
	if (target != noone) {
		endPoint.x = target.x
		endPoint.y = target.y
	}
	
	var inst = instance_create_depth(target.x, target.y, depths.fx, obj_particle_single_cycle)
	inst.sprite_index = spr_particle_32_circle_boom
	
	create_chain_lightning_fx(projectile.spawnPoint, endPoint)
	
	if (projectile.respawnCount == 0) {
		return 0
	}
	
	if (obj_ability_shock.runes[enumRunes.dreygoth].enabled) {
		inst = instance_create_depth(
			obj_player.x,
			obj_player.y,
			depths.playerProjectile,
			obj_chain_lit_bolt
		)

		var angle = point_direction(inst.x, inst.y, target.x, target.y)
		var velocity = get_velocity_from_angle(angle, inst.moveSpeedMax)

		inst.xVel = velocity[0]		
		inst.yVel = velocity[1]		
		inst.seekTarget = target
		inst.respawnCount = projectile.respawnCount - 1
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
			inst = instance_create_depth(
				target.x,
				target.y,
				depths.playerProjectile,
				obj_chain_lit_bolt
			)

			var angle = point_direction(inst.x, inst.y, closestInst.x, closestInst.y)
			var velocity = get_velocity_from_angle(angle, inst.moveSpeedMax)

			inst.xVel = velocity[0]		
			inst.yVel = velocity[1]		
			inst.seekTarget = closestInst
			inst.respawnCount = projectile.respawnCount - 1
			inst.hitList = projectile.hitList
			
			//show_message("collision: " + string(inst.respawnCount))

			array_push(inst.hitList, new hitListEntry(target, 999))
		}
	}
}