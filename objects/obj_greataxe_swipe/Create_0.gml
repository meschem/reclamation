/// @description Init

event_inherited()

distanceMax = 150
hitCount = 0

damageDirect = 15
targetsMax = -1
targetsMaxPerFrame = -1
damageLostPerTarget = 0
hitsWalls = false
reverseSwipe = false

damageFrameCooldown = 120

enemiesPerCrit = 3		// Crits every X enemies struck, randomly selected

knockback = 16

animSpeed = 1

onHitSounds = [
	snd_punch_1, snd_punch_2, snd_punch_3
]

///@description						Marks enemies for crit
///@param {id.DsList} enemyList
preDamage = function(enemyList) {
	if (ds_list_size(enemyList) == 0) {
		return 0
	}
	
	var i = 0
	
	hitCount += ds_list_size(enemyList)
	
	while (hitCount >= enemiesPerCrit) {
		hitCount -= enemiesPerCrit
		enemyList[| i].markedForCrit = true

		i++
	}
}

onDeathFx = function() {
	if (hitCount > 0) {
		owner.addUltimateCharge(15)
	}
}

///@param {id.Instance} target		Target being hit
onCollideFx = function(target)
{
	var i = irandom(array_length(onHitSounds) - 1)
	
	audio_play_sound(onHitSounds[i], 0, false)
}
