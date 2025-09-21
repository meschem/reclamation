
age++

if (age >= lifeSpan) {
	instance_create_depth(x, y, depths.enemy, boss)
	instance_destroy()
} else {
	if (!drawBoss && boss != obj_none) {
		bossSprite = object_get_sprite(boss)
		drawBoss = true
	}
	
	drawBossAlpha = (age / lifeSpan) * 0.8
}
