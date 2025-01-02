if (game_is_paused()) {
	return 0
}

age++

if (hp <= 0) {
	instance_destroy()
	return 0
}

depth = depths.enemy - y - heightOffset

for (var i = 0; i < array_length(particleBurstPoints); i++) {
	if (!particleBurstPoints[i].triggered && hp < (particleBurstPoints[i].hpRatio * hpMax)) {
		
		particleBurstPoints[i].triggered = true
		damageFx()
	}
}
