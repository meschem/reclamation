if (game_is_paused()) {
	return
}

age++

var attacked = false

with (owner) {
	attacked = equipment.weapon.attack()
}

if (attacked) {
	buff.bonusAttackArea += 0.1
}

if (age > lifeSpan) {
	instance_destroy(buff)
	instance_destroy()
}
