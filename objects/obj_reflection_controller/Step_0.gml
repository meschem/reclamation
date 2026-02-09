/// @description Insert description here
// You can write your code in this editor

if (!active) {
	return 0
}

age++

viewX = camera_get_view_x(camera)
viewY = camera_get_view_y(camera)

if (age % 3 == 0) {
	reflectedInstances = []
	
	for (var i = 0; i < array_length(reflectedObjectTypes); i++) {
		with (reflectedObjectTypes[i]) {
			var _inst = id
			
			if (obj_reflection_controller.inDrawBounds(_inst)) {
				array_push(obj_reflection_controller.reflectedInstances, _inst)
			}
		}
	}
}
