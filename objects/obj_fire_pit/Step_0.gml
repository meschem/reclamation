event_inherited()

if (age % 60 == 1) {
	//var maxDist = max(0, damageRadius - 8)
	//var distX = random_range(-maxDist, maxDist)
	//var distY = random_range(-maxDist, maxDist)
	//var angle = random(360)
	
	var distX = random_range(-9, 9)
	var distY = random_range(-9, 9)
	var inst = noone

	inst = instance_create_depth(x + distX, y + distY, depths.enemyProjectile - 10, obj_particle)
	
	inst.lifeSpan = 240
	inst.sprite_index = spr_fire_med
	inst.parent = id
	
	inst = instance_create_depth(x + distX, y + distY, depths.enemyProjectile - 5, obj_particle)
	
	inst.lifeSpan = 240
	inst.sprite_index = spr_fire_med_bg
	inst.parent = id
}
