
age = 0
lifeSpan = 360

xVel = 0
yVel = 0
zVel = 0

z = 0

indestructible = false

useZAxis = false

gravAccel = 0.15

owner = noone

bounceRatio = 0.8
frictionRatio = 0.8
minBounceVelocity = 0.25
maxBounces = 0
//moving = true
//lateralSpeed = 0

shadowSprite = spr_shadow_enemy_shot_basic
shadowOffset = 12

damageOnCollide = true
damageOnHit = 10

beingSummoned = false
summoningCdMax = 90
summoningCd = 0

feetOffset = 13

accel = 0.2
moveSpeedMax = 5
turnRate = 1
velocity = 0

destroyOnHit = true
markForDestroy = false
standardDeflectBlend = c_white

target = get_player_target()

onInstanceCollision = function(inst) {
	if (destroyOnHit) {
		instance_destroy()
	}
}

beginStep = function() {

}

onDeflect = function(_angle) {
	var _inst = noone
	var _mag = 0
	
	_inst = instance_create_depth(x, y, depths.fx, obj_particle_single_cycle)
	_inst.sprite_index =  spr_particle_growing_wave_w
	_inst.image_xscale = 0.75
	_inst.image_yscale = 0.75
	_inst.image_angle = _angle
	_inst.image_blend = standardDeflectBlend
	
	_inst = instance_create_depth(x, y, depths.fx, obj_particle_single_cycle)
	_inst.sprite_index =  spr_particle_32_circle_boom
	_inst.image_blend = standardDeflectBlend
	
	for (var i = 0; i < 14; i++) {
		_mag = random_range(0.3, 2.4)
		_inst = instance_create_depth(x, y, depths.fx, obj_particle_single_cycle)
		_inst.sprite_index = (i % 2 == 0) ? spr_particle_line_ray_2px_w : spr_particle_line_ray_w
		_inst.image_angle = _angle + random_range(-80, 80)
		_inst.image_blend = standardDeflectBlend
		_inst.xVel = angle_xvel(_inst.image_angle) * _mag
		_inst.yVel = angle_yvel(_inst.image_angle) * _mag
	}
}
