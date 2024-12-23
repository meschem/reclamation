/// @description Apply offset

if (offsetType == spawnZoneOffsetTypes.none) {
	return 0
}

switch (offsetType) {
	case spawnZoneOffsetTypes.up:
		y = obj_player.y - (camera_get_view_height(view_camera[0]) / 2) - spawnMargin
		x = obj_player.x
	break
	
	case spawnZoneOffsetTypes.right:
		y = obj_player.y
		x = obj_player.x + (camera_get_view_width(view_camera[0]) / 2) + spawnMargin
	break
	
	case spawnZoneOffsetTypes.down:
		y = obj_player.y + (camera_get_view_height(view_camera[0]) / 2) + spawnMargin
		x = obj_player.x
	break
	
	case spawnZoneOffsetTypes.left:
		y = obj_player.y
		x = obj_player.x - (camera_get_view_width(view_camera[0]) / 2) - spawnMargin
	break
}
