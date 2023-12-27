
event_inherited()

name = "Lit Crit"
description = "Sent out a bolt of chain lightning on critical hits"
active = false



addLifeCycleEvent(enumLifeCycleEvents.create, function(target) {
	with (target) {
		image_xscale = 2
		image_yscale = 2
	}
})
