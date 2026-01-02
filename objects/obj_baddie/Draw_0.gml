
if (shadowSprite >= 0) {
	draw_sprite(
		shadowSprite,
		0,
		x,
		y + (sprite_height / 2) + shadowOffset
	)
}

if (outlineColor != c_black) {
	outline_start(1, outlineColor, sprite_index, 200)
}

if (age - damagedOn <= 6) {
	shader_set(shd_white_flash)
}

draw_sprite_ext(
	sprite_index,
	image_index,
	round(x),
	round(y + floatOffset),
	image_xscale * damageXScaleMultiplier,
	image_yscale * damageYScaleMultiplier,
	rotation,
	image_blend,
	image_alpha
)

if (stunLength > 0) {
	draw_sprite(spr_stun_spiral, 0, x, y - (sprite_height) + 9)
} else if (swarmIcon != spr_none) {
    draw_sprite(swarmIcon, swarmIconIndex, x, y - (sprite_height) + 9)
}

//if (markedForCrit) {
	//draw_text(x, y, "marked")
//}

shader_reset()
