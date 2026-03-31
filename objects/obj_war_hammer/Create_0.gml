/// @description Init

event_inherited()

//projectileType = projectileTypes.weapon

angleSpriteToVelocity = true

distanceMax = 150

damageDirect = 30

hitStun = true
acceleration = 0.8
targetsHit = 0
targetsMax = 1
damageLostPerTarget = 10

damageFrameCooldown = 120

// damageFrameCooldown = 60 // not used yet...

create_ribbon(id, obj_ribbon, 18, 6)

knockback = 20

shadowSprite = spr_war_hammer_shadow

wakes = []

applyWakes = function(_count) {
    if (_count >= 1) {
        var _wake = instance_create_depth(x, y, depth, obj_war_hammer_wake_sm)
        array_push(wakes, _wake)
    }
    
    if (_count >= 2) {
        var _wake = instance_create_depth(x, y, depth, obj_war_hammer_wake_md)
        array_push(wakes, _wake)
    }
    
    for (var i = 0; i < array_length(wakes); i++) {
    	//wakes[i].xVel = xVel
        //wakes[i].yVel = yVel
        wakes[i].owner = owner
        //wakes[i].image_xscale = image_xscale
        //wakes[i].image_yscale = image_yscale
        wakes[i].image_angle = image_angle
    }
}

stepEnd = function() {
    for (var i = 0; i < array_length(wakes); i++) {
        if (instance_exists(wakes[i])) {
            wakes[i].x = x
            wakes[i].y = y
            //wakes[i].image_xscale = image_xscale
            //wakes[i].image_yscale = image_yscale
            wakes[i].image_angle = image_angle
        }
    }
}

onHit = function(_target) {
	//if (!hitStun) {
		//hitStun = true
	//create_hit_stun(1)
	create_screenshake(screenshake_light)
}

onKill = function() {
    create_hit_stun(2)
}

onCollideFx = function(_target = noone)
{
	spawn_fx_small_burst(x, y)
    heavy_metal_hit(_target)
}
