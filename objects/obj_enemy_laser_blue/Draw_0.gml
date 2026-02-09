
draw_self()

draw_sprite_ext(
	starSprite,
	starImageIndex,
	x, y,
	starSpriteScaleX, 
	starSpriteScaleY,
	starAngle,
	c_white,
	1
)

draw_sprite_ext(
	laserSpriteEndPiece,
	floor(age / 15),
	laserSpriteEndPiecePos.x,
	laserSpriteEndPiecePos.y,
	1.5, 1.5, 0,
	image_blend,
	image_alpha
)
