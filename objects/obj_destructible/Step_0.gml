if (game_is_paused()) {
	return 0
}

age++

if (hp <= 0) {
	instance_destroy()
	return 0
}

if (lifeSpan > 0 && age >= lifeSpan) {
	instance_destroy()
	return 0
}

if (hp < hpMax && shakeLastHp < hp) {
	shakeLastHp = hp
	shakeCur = shakeOnHit
}

if (shakeCur > 0) {
	shakeCur--
	
	shakeOffsetX = irandom(4) - 2
	shakeOffsetY = irandom(4) - 2
} else {
	shakeOffsetX = 0
	shakeOffsetY = 0
}

depth = depths.enemy - y - heightOffset

for (var i = 0; i < array_length(particleBurstPoints); i++) {
	if (!particleBurstPoints[i].triggered && hp < (particleBurstPoints[i].hpRatio * hpMax)) {
		
		particleBurstPoints[i].triggered = true
		damageFx()
	}
}
