///@description			Init
targetX = 0
targetY = 0
//lobHeight = 30
lobGravity = 1

lifeSpan = 60
age = 0

startX = 0
startY = 0

prevX = 0
prevY = 0

calculatedY = 0

z = 0
zVel = -0.5 * lobGravity * lifeSpan
zRatio = 0.1

itemToSpawn = noone
ribbonColor = c_white

ribbon = create_ribbon(id, obj_ribbon, 24, 10)
ribbon.fades = false

///@description							Set a color
///@param {constant.Color} _color		Color to set to
setColor = function(_color) {
	image_blend = _color
	trailColor = _color
}
