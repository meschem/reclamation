/// @description Insert description here
// You can write your code in this editor

surfaceMirror = -1

surfaceWidth = view_width()
surfaceHeight = view_height()

surfaceMirror = surface_create(surfaceWidth, surfaceHeight)

viewX = 0
viewY = 0

camera = view_camera[0]

age = 0

active = true

reflectedObjectTypes = [
	obj_player,
	obj_projectile,
	obj_baddie,
	obj_destructible,
	obj_particle_bouncer,
	obj_pickup
]

reflectedInstances = []

inDrawBounds = function(_inst) {
	if (
		_inst.x > camera_get_view_x(camera) &&
		_inst.x < camera_get_view_x(camera) + camera_get_view_width(camera) &&
		_inst.y > camera_get_view_y(camera) &&
		_inst.y < camera_get_view_y(camera) + camera_get_view_height(camera)
	) {
		return true
	}
	
	return false
}