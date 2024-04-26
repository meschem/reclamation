/// @description  Enumerates spawners

if (obj_game_controller.debugMode = true) {
	var i = 0
	var spawnName = ""
	var drawX = debugDrawLoc.x
	var drawY = debugDrawLoc.y
	var scalar = spawnCountScalar
	draw_set_font(font_dogica_s)
	draw_set_color(c_white)
	
	with (obj_spawner) {
		if (!active) {
			continue
		}
		
		spawnName = object_get_name(enemyTypes[0])
		
		draw_text(
			drawX, drawY,
			$"Spawning {spawnCount * scalar} {spawnName} every {frames_to_seconds(spawnPeriod)}s"
		)
		
		drawY += 20
	}
}
