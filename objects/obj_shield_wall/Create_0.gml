/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

hpMax = 9999
hp = hpMax

invulnFrames = 0

returnKnockback = 20

returnDamage = obj_ability_shield_wall.runes[enumRunes.voldan].enabled ? 20 : 0

shadowSprite = spr_shadow_lg
shadowOffset = 9

slamming = false

spriteSpawn = spr_shield_wall_segment_spawn
spriteIdle = spr_shield_wall_segment

sprite_index = spriteSpawn
