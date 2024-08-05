///@description					Runs Weapon Upgrade lifecycle events for a projectile
///@param {real} _eventType		Type of lifecycle event. Uses enumLifeCycleEvents
///@param {any} _data			Data that is pulled from the events
///@param {id.Instance} _proj	Projectile calling the event
function run_wupg_lifecycle_events(_eventType, _data, _proj = id) {
	with (obj_weapon_upgrade) {
		if (active) {
			for (var i = 0; i < array_length(lifeCycleEvents); i++) {
				if (lifeCycleEvents[i].cycleType == _eventType) {
					lifeCycleEvents[i].cycleFunc(_data)
				}
			}
		}
	}
}
