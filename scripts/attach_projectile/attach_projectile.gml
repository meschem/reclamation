///@description						Attaches a projectile to an object
///@param {id.Instance} proj		Projectile to be attached
///@param {any} parent				Parent to attach to
function attach_projectile(proj, parent) {
	proj.attachedTo = parent
	proj.attachedOrigin = new vec2(parent.x, parent.y)
	
	proj.x = parent.x
	proj.y = parent.y
}