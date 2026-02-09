
if (game_is_paused()) {
	return 0
}

if (!instance_exists(hostId)) {
	instance_destroy()
	return 0
}

age++

// 1. Get host position
var _hx = hostId.x
var _hy = 0

if (variable_instance_exists(hostId, "calculatedY")) {
	_hy = hostId.calculatedY
} else if (variable_instance_exists(hostId, "z")) {
	_hy = hostId.y + hostId.z
} else {
	_hy = hostId.y
}

if (!fades) {
	trailAlphaEnd = trailAlphaStart
}

if (!shrinks) {
	trailWidthEnd = trailWidthStart
}

if (knuckling > 0 && age % knuckleRate == 0) {
	_hy += random(knuckling) * random_sign()
	_hx += random(knuckling) * random_sign()
}

// 2. Add new point (x, y) to the front of the list (index 0)
// The newest point is always at the front, the oldest is at the end.
ds_list_insert(pointList, 0, _hy)
ds_list_insert(pointList, 0, _hx) // Insert x first, then y shifts to index 1

// 3. Trim the list if it exceeds the max length
// We store 2 values per point (x and y), so max size is trail_length * 2
var _max_size = trailLength * 2

while (ds_list_size(pointList) > _max_size) {
    // Delete the oldest point (x and y) from the end of the list
	var _last_index = ds_list_size(pointList) - 1
	ds_list_delete(pointList, _last_index) // Delete oldest y
	ds_list_delete(pointList, _last_index - 1) // Delete oldest x
}