// Inherit the parent event
event_inherited();

hitsWalls = false

damageType = enumDamageTypes.normal

movementType = projMovementTypes.explicit
attachedTo = obj_player
projectileType = projectileTypes.ability

lifeSpan = -1

distanceOffsetTarget = -1
distanceOffsetMax = 140
distanceOffsetMin = 50

knockbackDistance = 70

targetsMax = 99999
damageDirect = 1 
shadowSprite = spr_shadow_lg
shadowOffsetY = 15

angle = 0
rotationRate = 0
rotationRateMax = 5
rotationRateMin = 1.5
rotationChangeRate = 0.05
distanceOffset = 0
distanceChangeRate = 1

//explodeOnDeath = false

stunningStrike = false
shockLoaded = false
shockLoadedRadius = 30
shockLoadedDamageScalar = 0.5

active = true

stepBegin = function() {
	if (owner == noone || !instance_exists(owner)) {
		return 0
	}
    
    if (!active) {
        collisionActive = false
        image_alpha = 0
    } else if (!collisionActive) {
        collisionActive = true
        image_index = 0
        sprite_index = (shockLoaded) ? spr_shield_wall_lit_segment_spawn : spr_shield_wall_segment_spawn
        image_alpha = 1
        
        var _pitch = random_range(0.9, 1.1)
        var _gain = random_range(0.9, 1.1)
        audio_play_sound(snd_shield_summon, 2, false, _gain, 0, _pitch)
    }
    
    return 0
}

calcVelocity = function () {
	angle += rotationRate
	
	var pos = get_vec2_from_angle_mag(angle, distanceOffset)
	
	xVel = pos.x
	yVel = pos.y
}

///@description                 Disables on hit
///@param {id.Instance} target   Target being hit
onHit = function(target) {
    var _distance = knockbackDistance * get_player_stat(enumPlayerStats.knockbackScalar, owner)
    
    if (stunningStrike && target.hp >= target.hpMax) {
        stun_baddie(target, 1)
    }
    
    if (shockLoaded) {
        instance_create_depth(x, y, depths.fx, obj_fx_shock_loaded)
        
       	var enemies = ds_list_create()	
        var radius = shockLoadedRadius * get_player_stat(enumPlayerStats.areaOfEffectScalar, owner)
        var inst = create_fx_fading_circle(x, y, radius)
        inst.alphaStart = 0.75

    	var count = collision_circle_list(
    		x,
    		y,
    		radius,
    		obj_baddie,
    		false,
    		true,
    		enemies,
    		false
    	)
        
        for (var i = 0; i < count; i++) {
            damage_baddie_with_type((enemies[| i]), damageDirect * shockLoadedDamageScalar, enumDamageTypes.lightning, owner)
        }
        
        ds_list_destroy(enemies)
    }
    
    knockback_baddie(target, _distance, angle)
    target.xVel = 0
    target.yVel = 0
     
    active = false
}

onCollideFx = function(_target = noone)
{
	spawn_fx_small_burst(x, y)
    light_metal_hit(_target)
}
