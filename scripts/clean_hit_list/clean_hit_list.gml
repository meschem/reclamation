///@description							Iterates through a hitList array to clear dead entries
///@param {array<struct.hitListEntry>}	hitList				hitList array to clean
function clean_hit_list(hitList) {
	var frame = get_current_frame()
	
	//FIXME PERF
	for (var i = 0; i < array_length(hitList); i++) {
		if (hitList[i].clearFrame >= frame) {
			array_delete(hitList, i, 1)
		}
	}
}