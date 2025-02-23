///@description   Stores baddies for the run
function store_baddies() {
	with (obj_baddie) {
		array_push(
			obj_run_controller.storedBaddies,
			{
				object: object_index,
				hp: hp,
				rm: room
			}		
		)
	}
}
