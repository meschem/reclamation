///@Description		

age = 0

radius = 48
initialDelay = seconds_to_frames(4)
duration = seconds_to_frames(6)
damagePerTick = 1
ticks = 4
tickCd = 0
tickRate = seconds_to_frames(0.33)
critChance = 0
critMultiplier = 2
maxCrits = 0

explosionDamage = 1
explosionRadius = 72

owner = noone
playerTarget = false

active = false

shockingFinale = false

collisionList = ds_list_create()
targets = [obj_baddie, obj_destructible]
