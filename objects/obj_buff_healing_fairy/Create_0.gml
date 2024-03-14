/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

timer = 400
healAmount = 10

desiredPos = new vec2()
newPos = new vec2()

onRemove = function() {
	heal_player(owner, healAmount)
}
