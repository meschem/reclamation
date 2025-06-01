///@description		Event Controller

enum eventStates {
	inactive,
	active,
	reward
}

state = eventStates.inactive

name = "Unnamed event"
description = "Do something cool"

time = 0
length = 0

count = 0
maxCount = 0

//nameText = create_text(
//	name,
//	camera_get_view_width()
//)