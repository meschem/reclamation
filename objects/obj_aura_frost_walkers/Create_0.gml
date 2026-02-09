
// Inherit the parent event
event_inherited()

auraSpikes = []
auraSpikeCount = 5

auraSpikeSprite = spr_particle_icicle
auraSpikeImageIndex = 2
auraSpikesAlpha = 1
//rotationSpeed = 16

for (var i = 0; i < auraSpikeCount; i++) {
	var _spike = {
		angle: 360 / auraSpikeCount * i,
		xPos: -99,
		yPos: -99,
	}
	
	array_push(auraSpikes, _spike)
}