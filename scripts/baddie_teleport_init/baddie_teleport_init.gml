///@description			Inits vars for teleporting behavior
///						This is for base AI behavior, thus defaults to false
function baddie_teleport_init() {
	teleportEnabled = false
	teleportCdMax = seconds_to_frames(1)
	teleportCdCur = teleportCdMax
	teleportMinDistanceToTarget = 100
	teleportMaxDistanceToTarget = -1
}