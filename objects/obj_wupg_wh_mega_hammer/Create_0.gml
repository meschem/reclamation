
event_inherited()

name = "Mega Hammer"
description = "Increases the size of the hammer, increasing damage and knockback."
active = false

bonusDamageScalar = 1.5
hammerSizeScalar = 2

addLifeCycleEvent(enumLifeCycleEvents.create, function(target) {
	with (target) {
		image_xscale = 2
		image_yscale = 2
	}
})
