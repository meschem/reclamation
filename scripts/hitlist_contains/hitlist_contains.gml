///@decription									Checks if a hitlist contains a target
///@param {array<struct.hitListEntry>} hitList	Hitlist to check
///@param {id.Instance} target					Instance to check

function hitlist_contains(hitList, target) {
	for (var i = 0; i < array_length(hitList); i++) {
		if (hitList[i].instance == target) {
			return true
		}
	}
	
	return false
}