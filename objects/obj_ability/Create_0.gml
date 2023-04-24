/// @description Insert description here
// You can write your code in this editor

name = "No Name"
description = "No description yet"
icon = spr_not_set
active = false

level = 0
maxLevel = 3

curCd = 0
maxCd = 300

enabled = false

activate = function() {
	show_message("activate() not set on ability object")
}

onLevel = function () {
	show_debug_message(name + " leveled up!")
}
