
age = 0

var _inst = instance_create_depth(x, y, depths.fx, obj_particle_single_cycle)
_inst.sprite_index = spr_particle_stretch_flash_w

_inst = instance_create_depth(x, y, depths.fx, obj_particle_single_cycle)
_inst.sprite_index = spr_particle_lightning_medium
_inst.image_angle = random(360)

var _count = 24
var _angleBase = random(360)
var _angleVariance = 6

for (var i = 0; i < _count; i++) {
    var _angle = _angleBase + random_range(_angleVariance, _angleVariance)
    var _vel = random_range(2, 4)
    var _xVel = angle_xvel(_angle) * _vel
    var _yVel = angle_yvel(_angle) * _vel
    
    _inst = instance_create_depth(x, y, depths.fx, obj_particle_shrinking_circle)
    _inst.image_xscale = 0.25
    _inst.image_yscale = 0.25
    _inst.xVel = _xVel
    _inst.yVel = _yVel
    
    _angleBase += (360 / _count)
}

instance_destroy()
