// Inherit the parent event
event_inherited();

displayText = "Death FX"
endText = global.createDeathParticles ? "On" : "Off"

onClick = buttonOnClickBehaviors.custom

onClickCustom = function() {
	global.createDeathParticles = !global.createDeathParticles
	
	endText = global.createDeathParticles ? "On" : "Off"
}

