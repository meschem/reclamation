// Inherit the parent event
event_inherited();

displayText = "Particle FX"
endText = global.createParticleFx ? "On" : "Off"

onClick = buttonOnClickBehaviors.custom

onClickCustom = function() {
	global.createParticleFx = !global.createParticleFx
	
	endText = global.createParticleFx ? "On" : "Off"
}
