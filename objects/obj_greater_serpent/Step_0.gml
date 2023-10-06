
event_inherited()

if (game_is_paused()) return 0

venomSpitCooldown--

if (venomSpitCooldown <= 0) {
	venomSpitCooldown = venomSpitCooldownMax
	
	var inst, angle, mag, distance
	var player = get_player_target()
	
	for (var i = 0; i < venomSpitCount; i++) {
		inst = instance_create_depth(
			x + attackOffset.x,
			y,
			depths.enemyProjectile,
			obj_enemy_venom_lob_shot
		)
		
		var randomX = random_range(-venomSpitSpread, venomSpitSpread)
		var randomY = random_range(-venomSpitSpread, venomSpitSpread)
		
		inst.z = -attackOffset.y
		
		inst.calculateVelocity(player.x + randomX, player.y + randomY)
	}
}