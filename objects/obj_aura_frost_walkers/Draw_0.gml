/// @description Insert description here
// You can write your code in this editor

draw_self()

for (var i = 0; i < array_length(auraSpikes); i++) {
	draw_sprite_ext(
		auraSpikeSprite,
		auraSpikeImageIndex,
		auraSpikes[i].xPos,
		auraSpikes[i].yPos,
		1, 1,
		auraSpikes[i].angle,
		c_white,
		auraSpikesAlpha
	)
}
