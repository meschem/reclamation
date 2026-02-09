
if (!statsProcessed) {
	process_equipment_stats()
}

if (game_is_paused()) {
	return 0
}

onStep()
