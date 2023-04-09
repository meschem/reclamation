///@description   Description
function delayed_ice_blast(spawnX, spawnY, offSet = 0, projectile = obj_enemy_blue_shot) {
	var inst = instance_create_depth(spawnX, spawnY, depths.enemyProjectile, projectile)
	
	inst.beingSummoned = true
	inst.summoningCdMax = 60
	inst.summoningCd = inst.summoningCdMax
	inst.target = get_player_target()
	inst.image_alpha = 0
}
