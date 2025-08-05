/// @description Insert description here
// You can write your code in this editor

drawText = "The Curse has fallen. Decay is wrought."

age = 0
spawnRate = stf(2)
spawnRateWraith = stf(4)
spawnRateChamp = stf(15)
spawnCount = 2

if (layer_exists("Curse_Overlay")) {
	curseLayerDraw = true
	curseLayer = layer_get_id("Curse_Overlay")
	
	layer_set_visible(curseLayer, true)
	
	curseFx = layer_get_fx("Curse_Overlay")
} else {
	curseLayerDraw = false
	curseLayer = -1
}

if (layer_exists("Curse_Cloud_Overlay")) {
	layer_set_alpha()
}

curseBlend = 0
curseBlendAgeMax = stf(20)
curseBlendColorEnd = get_color(colors.dark_purple)

drawLocation = new vec2(
	(view_width() / 2) - (string_width(drawText) / 2),
	16
)

with (obj_spawner) {
	instance_destroy()
}
