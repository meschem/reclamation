if (game_is_paused())
	return 0

angleOffset += rotateSpeed

var position = get_vector_from_angle_mag(angleOffset, distance)

x = target.x + position[0]
y = target.y + position[1]

for (var i = 0; i < array_length(damagedAtAge); i++) {
	if (damagedAtAge[i] < age - damageCdPerEntity) {
		array_delete(damagedEntities, i, 1)
		array_delete(damagedAtAge, i, 1)
		
		i--
	} else {
		break
	}
}

ds_list_clear(enemies)

var count = collision_circle_list(
	x, y,
	damageRadius,
	obj_baddie,
	false,
	true,
	enemies,
	false
)

if (count > 0) {
	var hitEntity
	
	for (var i = 0; i < count; i++)
	{
		hitEntity = enemies[| i]

		if (!array_contains(damagedEntities, hitEntity)) {
			damage_baddie(hitEntity, damage)	
			array_push(damagedEntities, hitEntity)
			array_push(damagedAtAge, age)
		}		
	}
}

age++

if (age >= lifeSpan)
	instance_destroy()
