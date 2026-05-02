/// @description Init

event_inherited()

name = "Burning Dead"

hpMax = 30
hp = hpMax

pushForce = 6
pushRadius = 20

shadowSprite = spr_shadow_med
shadowOffset = -1

walkAnimType = entityWalkAnimTypes.curves

impactMaterial = enumImpactMaterials.bone

deathParticles = [
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_bone_red,
	obj_ptb_skel_ribs_red,
	obj_ptb_skel_skull_red,
]

onDestroy = function() {
    audio_play_sound(snd_bone_rattle, 1, false, 0.5, 0, random_range(0.9, 1.1))
    audio_play_sound(snd_wood_smash, 1, false, 0.7, 0, random_range(0.9, 1.1))
    
    var inst = instance_create_depth(x, y, depths.enemyProjectile, obj_enemy_red_shot)

    with (inst) {
    	accel_towards_point(obj_player.x, obj_player.y, accel)
    }
}

add_baddie_gold_fodder
