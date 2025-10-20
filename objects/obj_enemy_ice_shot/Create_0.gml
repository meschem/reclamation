event_inherited();

beingSummoned = false
summoningCdMax = 90
summoningCd = 0

accel = 0.1
moveSpeedMax = 2
turnRate = random_range(3, 4) * random_sign()

beginStep = function() {
	image_angle += turnRate
}
