
weight = baddie_weight_immovable

hp = 60
hpMax = hp
lastHp = hp

age = 0
lifeSpan = -1
damagedOn = -99

heightOffset = 6

particleBurstPoints = [
	{
		hpRatio: 0.66,
		triggered: false
	},
	{
		hpRatio: 0.33,
		triggered: false
	}
	
]

parentBaddie = noone // used for hitList stuff
debuffShockAmount = 0
shockedLength = 0
poisonLength = 0
poisonStacks = 0
poisonImmune = true
immovable = true
markedForCrit = false

targetType = targetTypes.destructible

lastDamageAngle = 0
lastDamageForce = 1

damageParticles = []
deathParticles = []
deathParticleSpawnRange = new vec2(12, 12)

revealList = []

onDamaged = function() {}
onDeath = function() {}

damageFx = function() {
	if (global.createDeathParticles) {
		spawn_fx_bouncers(damageParticles, 90, lastDamageForce)
	}
}

deathFx = function() {
	if (global.createDeathParticles) {
		spawn_fx_bouncers(deathParticles, lastDamageAngle, lastDamageForce)
	}
}
