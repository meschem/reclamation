///@description						Sets up teleporting for a baddie
///@param {real} cooldownMin		Min cooldown, random
///@param {real} cooldownMax		Max cooldown, random
///@param {real} minDistance		Min distance from target to use when teleporting
///@param {real} maxDistance		Max distance from target
function baddie_teleport_enable(cooldownMin, cooldownMax = -1, minDistance = 10, maxDistance = -1) {
	teleportEnabled = true
	teleportCdMin = cooldownMin
	teleportCdMax = (cooldownMax == -1) ? teleportCdMin : cooldownMax
	teleportCdCur = irandom_range(cooldownMin, cooldownMax)
	teleportMinDistanceToTarget = minDistance
	teleportMaxDistanceToTarget = maxDistance
	teleportFx = obj_none
}