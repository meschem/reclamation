
if (infobox != noone && !instance_exists(infobox)) {
	create_toaster("Skipping infobox draw for button", errorLevels.warning)
	skipDraw = true
}