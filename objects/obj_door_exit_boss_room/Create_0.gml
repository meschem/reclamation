/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited()

name = "Unknown Boss Dungeon"

openTextString = "OPENED"
openTextLocation = new vec2()

	//(view_width() / 2) - (string_width(openTextString) / 2),
	//16
//)

// Set loadRoom = room_number to set a destination for a boss fight
age = 1
open = false
openCurseAmount = mtf(4)
openedOn = -1

door = instance_create_depth(
    x, y, depth - 10,
    obj_door_demon_boss
)

door.exitDoor = id

mapIcon = spr_dungeon_icon

openDoor = function() {
    open = true
    ping_map_location(x, y)
    instance_destroy(door)
    openedOn = age
    
    var _openTextString = $"The {name} Has Been Opened!"
    
    with (obj_ui_controller) {
        createBigAlertText(_openTextString)
    }
}
